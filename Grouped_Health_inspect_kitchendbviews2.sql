USE grouped_health_inspect_kitchendb;

CREATE VIEW StaffCompetencySummary AS
SELECT 
    kp.StaffID,
    kp.FirstName,
    kp.LastName,
    kp.StaffRole,
    kp.StationAssigned,
    COUNT(pc.CompetencyID) AS TotalCompetencies,
    SUM(CASE WHEN pc.IsCertified = TRUE THEN 1 ELSE 0 END) AS CertifiedCount,
    MAX(CASE 
        WHEN pc.ExpiryDate < CURDATE() THEN 'EXPIRED'
        WHEN pc.ExpiryDate < DATE_ADD(CURDATE(), INTERVAL 30 DAY) THEN 'EXPIRING SOON'
        ELSE 'VALID'
    END) AS CertificationStatus
FROM KitchenPersonnel kp
LEFT JOIN PersonnelCompetencies pc ON kp.StaffID = pc.StaffID
GROUP BY kp.StaffID, kp.FirstName, kp.LastName, kp.StaffRole, kp.StationAssigned;

CREATE VIEW StaffViolationsOverview AS
SELECT 
    kp.StaffID,
    CONCAT(kp.FirstName, ' ', kp.LastName) AS FullName,
    kp.StaffRole,
    COUNT(pv.ViolationID) AS TotalViolations,
    SUM(CASE WHEN pv.SeverityLevel = 'High' THEN 1 ELSE 0 END) AS HighSeverityViolations,
    SUM(CASE WHEN pv.SeverityLevel = 'Moderate' THEN 1 ELSE 0 END) AS ModerateSeverityViolations,
    SUM(CASE WHEN pv.SeverityLevel = 'Low' THEN 1 ELSE 0 END) AS LowSeverityViolations,
    SUM(CASE WHEN pv.CorrectiveActionTaken = TRUE THEN 1 ELSE 0 END) AS CorrectiveActionsTaken,
    MAX(pv.ViolationDate) AS LastViolationDate
FROM KitchenPersonnel kp
LEFT JOIN PersonnelViolations pv ON kp.StaffID = pv.StaffID
GROUP BY kp.StaffID, kp.FirstName, kp.LastName, kp.StaffRole
ORDER BY TotalViolations DESC;

CREATE VIEW ExpiringConsumablesAlert AS
SELECT 
    Consumable_id,
    Consumable_expiration_date,
    Consumable_quantity,
    Consumable_price,
    Consumable_allergen,
    DATEDIFF(Consumable_expiration_date, CURDATE()) AS DaysUntilExpiry,
    CASE 
        WHEN Consumable_expiration_date < CURDATE() THEN 'EXPIRED'
        WHEN DATEDIFF(Consumable_expiration_date, CURDATE()) <= 7 THEN 'CRITICAL (≤7 days)'
        WHEN DATEDIFF(Consumable_expiration_date, CURDATE()) <= 30 THEN 'WARNING (≤30 days)'
        ELSE 'OK'
    END AS ExpiryStatus
FROM Consumables
WHERE Consumable_expiration_date IS NOT NULL
ORDER BY DaysUntilExpiry ASC;

CREATE VIEW AllergenInventoryReport AS
SELECT 
    Consumable_allergen AS AllergenType,
    COUNT(*) AS ItemCount,
    SUM(Consumable_quantity) AS TotalQuantity,
    ROUND(AVG(Consumable_price), 2) AS AveragePrice,
    ROUND(SUM(Consumable_price * Consumable_quantity), 2) AS TotalInventoryValue,
    GROUP_CONCAT(DISTINCT 
        CASE 
            WHEN DATEDIFF(Consumable_expiration_date, CURDATE()) <= 30 
            THEN CONCAT('ID:', Consumable_id, ' (Exp:', Consumable_expiration_date, ')')
            ELSE NULL 
        END 
        SEPARATOR ', ') AS ItemsExpiringSoon
FROM Consumables
GROUP BY Consumable_allergen
ORDER BY ItemCount DESC;

CREATE VIEW SanitationComplianceDashboard AS
SELECT 
    kp.StaffID,
    CONCAT(kp.FirstName, ' ', kp.LastName) AS StaffName,
    kp.StaffRole,
    COUNT(DISTINCT psl.LogID) AS TotalCleaningTasks,
    COUNT(DISTINCT DATE(psl.CleaningDate)) AS UniqueCleaningDays,
    GROUP_CONCAT(DISTINCT psl.AreaCleaned ORDER BY psl.AreaCleaned SEPARATOR ', ') AS AreasCleaned,
    MAX(psl.CleaningDate) AS LastCleaningDate,
    AVG(TIME_TO_SEC(psl.CleaningTime)) AS AvgCleaningTimeSeconds
FROM KitchenPersonnel kp
LEFT JOIN PersonnelSanitationLogs psl ON kp.StaffID = psl.StaffID
WHERE psl.CleaningDate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
GROUP BY kp.StaffID, kp.FirstName, kp.LastName, kp.StaffRole
ORDER BY TotalCleaningTasks DESC;

CREATE VIEW RecipeCostAnalysis AS
SELECT 
    rt.Recipe_id,
    rt.Recipe_name,
    rt.Category,
    rt.Recipe_difficulty_level,
    CONCAT(kp.FirstName, ' ', kp.LastName) AS CreatedBy,
    COUNT(DISTINCT rcs.consumable_id) AS IngredientCount,
    COUNT(DISTINCT rcs.supplier_id) AS SupplierCount,
    ROUND(SUM(rcs.quantity_used * rcs.supply_price), 2) AS EstimatedCostPerRecipe,
    GROUP_CONCAT(DISTINCT c.Consumable_allergen SEPARATOR ', ') AS AllergensPresent
FROM Recipe_Table rt
JOIN KitchenPersonnel kp ON rt.StaffID = kp.StaffID
LEFT JOIN Recipe_Consumables_Suppliers rcs ON rt.Recipe_id = rcs.recipe_id
LEFT JOIN Consumables c ON rcs.consumable_id = c.Consumable_id
GROUP BY rt.Recipe_id, rt.Recipe_name, rt.Category, rt.Recipe_difficulty_level, kp.FirstName, kp.LastName
ORDER BY EstimatedCostPerRecipe DESC;

CREATE VIEW SupplierPerformanceSummary AS
SELECT 
    s.supplier_id,
    s.supplier_name,
    s.contact_person,
    s.phone_number,
    s.city,
    s.country,
    COUNT(DISTINCT rcs.consumable_id) AS UniqueProductsSupplied,
    COUNT(DISTINCT rcs.recipe_id) AS RecipesSupported,
    ROUND(AVG(rcs.supply_price), 2) AS AveragePrice,
    MIN(c.Consumable_expiration_date) AS EarliestExpiryDate,
    GROUP_CONCAT(DISTINCT c.Consumable_allergen SEPARATOR ', ') AS AllergenTypes
FROM suppliers s
LEFT JOIN Recipe_Consumables_Suppliers rcs ON s.supplier_id = rcs.supplier_id
LEFT JOIN Consumables c ON rcs.consumable_id = c.Consumable_id
GROUP BY s.supplier_id, s.supplier_name, s.contact_person, s.phone_number, s.city, s.country
ORDER BY UniqueProductsSupplied DESC;

CREATE VIEW KitchenSafetyComplianceReport AS
SELECT 
    'PERSONNEL' AS Category,
    COUNT(DISTINCT kp.StaffID) AS TotalStaff,
    COUNT(DISTINCT pc.CompetencyID) AS TotalCertifications,
    SUM(CASE WHEN pc.IsCertified = TRUE AND pc.ExpiryDate > CURDATE() THEN 1 ELSE 0 END) AS ValidCertifications,
    CONCAT(ROUND(SUM(CASE WHEN pc.IsCertified = TRUE AND pc.ExpiryDate > CURDATE() THEN 1 ELSE 0 END) * 100.0 / 
          COUNT(DISTINCT kp.StaffID), 1), '%') AS CertificationRate
FROM KitchenPersonnel kp
LEFT JOIN PersonnelCompetencies pc ON kp.StaffID = pc.StaffID

UNION ALL

SELECT 
    'VIOLATIONS' AS Category,
    COUNT(*) AS TotalViolations,
    SUM(CASE WHEN CorrectiveActionTaken = TRUE THEN 1 ELSE 0 END) AS ResolvedViolations,
    SUM(CASE WHEN SeverityLevel = 'High' THEN 1 ELSE 0 END) AS HighSeverityViolations,
    CONCAT(ROUND(SUM(CASE WHEN CorrectiveActionTaken = TRUE THEN 1 ELSE 0 END) * 100.0 / 
          COUNT(*), 1), '%') AS ResolutionRate
FROM PersonnelViolations

UNION ALL

SELECT 
    'SANITATION' AS Category,
    COUNT(DISTINCT StaffID) AS StaffWithLogs,
    COUNT(*) AS TotalCleaningTasks,
    COUNT(DISTINCT AreaCleaned) AS UniqueAreasCleaned,
    CONCAT(ROUND(COUNT(DISTINCT DATE(CleaningDate)) * 100.0 / 
          DATEDIFF(MAX(CleaningDate), MIN(CleaningDate)) + 1, 1), '%') AS DailyComplianceRate
FROM PersonnelSanitationLogs
WHERE CleaningDate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)

UNION ALL

SELECT 
    'INVENTORY' AS Category,
    COUNT(*) AS TotalConsumables,
    SUM(CASE WHEN Consumable_expiration_date < CURDATE() THEN 1 ELSE 0 END) AS ExpiredItems,
    SUM(CASE WHEN Consumable_expiration_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY) THEN 1 ELSE 0 END) AS ExpiringThisWeek,
    CONCAT(ROUND(SUM(CASE WHEN Consumable_expiration_date > CURDATE() THEN 1 ELSE 0 END) * 100.0 / 
          COUNT(*), 1), '%') AS NonExpiredRate
FROM Consumables;

CREATE VIEW KitchenSafetyComplianceReport AS
SELECT 
    'PERSONNEL' AS Category,
    COUNT(DISTINCT kp.StaffID) AS TotalStaff,
    COUNT(DISTINCT pc.CompetencyID) AS TotalCertifications,
    SUM(CASE WHEN pc.IsCertified = TRUE AND pc.ExpiryDate > CURDATE() THEN 1 ELSE 0 END) AS ValidCertifications,
    CONCAT(ROUND(SUM(CASE WHEN pc.IsCertified = TRUE AND pc.ExpiryDate > CURDATE() THEN 1 ELSE 0 END) * 100.0 / 
          COUNT(DISTINCT kp.StaffID), 1), '%') AS CertificationRate
FROM KitchenPersonnel kp
LEFT JOIN PersonnelCompetencies pc ON kp.StaffID = pc.StaffID

UNION ALL

SELECT 
    'VIOLATIONS' AS Category,
    COUNT(*) AS TotalViolations,
    SUM(CASE WHEN CorrectiveActionTaken = TRUE THEN 1 ELSE 0 END) AS ResolvedViolations,
    SUM(CASE WHEN SeverityLevel = 'High' THEN 1 ELSE 0 END) AS HighSeverityViolations,
    CONCAT(ROUND(SUM(CASE WHEN CorrectiveActionTaken = TRUE THEN 1 ELSE 0 END) * 100.0 / 
          COUNT(*), 1), '%') AS ResolutionRate
FROM PersonnelViolations

UNION ALL

SELECT 
    'SANITATION' AS Category,
    COUNT(DISTINCT StaffID) AS StaffWithLogs,
    COUNT(*) AS TotalCleaningTasks,
    COUNT(DISTINCT AreaCleaned) AS UniqueAreasCleaned,
    CONCAT(ROUND(COUNT(DISTINCT DATE(CleaningDate)) * 100.0 / 
          DATEDIFF(MAX(CleaningDate), MIN(CleaningDate)) + 1, 1), '%') AS DailyComplianceRate
FROM PersonnelSanitationLogs
WHERE CleaningDate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)

UNION ALL

SELECT 
    'INVENTORY' AS Category,
    COUNT(*) AS TotalConsumables,
    SUM(CASE WHEN Consumable_expiration_date < CURDATE() THEN 1 ELSE 0 END) AS ExpiredItems,
    SUM(CASE WHEN Consumable_expiration_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY) THEN 1 ELSE 0 END) AS ExpiringThisWeek,
    CONCAT(ROUND(SUM(CASE WHEN Consumable_expiration_date > CURDATE() THEN 1 ELSE 0 END) * 100.0 / 
          COUNT(*), 1), '%') AS NonExpiredRate
FROM Consumables;

CREATE VIEW ExecutiveDashboard AS
WITH ViolationStats AS (
    SELECT 
        kp.StaffID,
        CONCAT(kp.FirstName, ' ', kp.LastName) AS StaffName,
        COUNT(pv.ViolationID) AS ViolationCount,
        SUM(CASE WHEN pv.SeverityLevel = 'High' THEN 1 ELSE 0 END) AS HighSeverityCount
    FROM KitchenPersonnel kp
    LEFT JOIN PersonnelViolations pv ON kp.StaffID = pv.StaffID
    WHERE pv.ViolationDate >= DATE_SUB(CURDATE(), INTERVAL 90 DAY)
    GROUP BY kp.StaffID, kp.FirstName, kp.LastName
),
SanitationStats AS (
    SELECT 
        StaffID,
        COUNT(*) AS CleaningCount,
        COUNT(DISTINCT AreaCleaned) AS UniqueAreasCleaned
    FROM PersonnelSanitationLogs
    WHERE CleaningDate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
    GROUP BY StaffID
)
SELECT 
    kp.StaffID,
    CONCAT(kp.FirstName, ' ', kp.LastName) AS FullName,
    kp.StaffRole,
    kp.StationAssigned,
    kp.HireDate,
    DATEDIFF(CURDATE(), kp.HireDate) AS DaysEmployed,
    COALESCE(vs.ViolationCount, 0) AS RecentViolations,
    COALESCE(vs.HighSeverityCount, 0) AS HighSeverityViolations,
    COALESCE(ss.CleaningCount, 0) AS RecentCleaningTasks,
    COALESCE(ss.UniqueAreasCleaned, 0) AS UniqueAreasCleaned,
    COUNT(pc.CompetencyID) AS TotalCompetencies,
    COUNT(CASE WHEN pc.IsCertified = TRUE AND pc.ExpiryDate > CURDATE() THEN 1 END) AS ActiveCertifications
FROM KitchenPersonnel kp
LEFT JOIN ViolationStats vs ON kp.StaffID = vs.StaffID
LEFT JOIN SanitationStats ss ON kp.StaffID = ss.StaffID
LEFT JOIN PersonnelCompetencies pc ON kp.StaffID = pc.StaffID
GROUP BY kp.StaffID, kp.FirstName, kp.LastName, kp.StaffRole, kp.StationAssigned, 
         kp.HireDate, vs.ViolationCount, vs.HighSeverityCount, 
         ss.CleaningCount, ss.UniqueAreasCleaned
ORDER BY kp.StaffRole, kp.LastName;

