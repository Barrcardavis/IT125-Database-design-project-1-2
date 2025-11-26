-- ==========================================================
-- Week 7 Quarterly Database Project Part 2 - Code
-- Based on the Quarterly Database Project Part 1 from week 3
-- Using Health_Inspection_KitchenDB database for my section of code to be added to main code
-- New database name may be selected with all 4 members of team join code.ALTER
-- Code testing will involve queries after code passes normalization Forms 1 thru 3.
-- ==========================================================





CREATE SCHEMA Grouped_Health_Inspect_KitchenDB;

USE Grouped_Health_Inspect_KitchenDB;

-- Creating Table for Kitchen Personell.
-- Random Data delivered from Mockaroo data creation site
-- https://www.mockaroo.com/
-- this website can make sql data file and deliver directly to MySQL for insertion into table data fields

CREATE TABLE KitchenPersonnel (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    StaffRole VARCHAR(50),
    Certification VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    HireDate DATE,
    StationAssigned VARCHAR(50)
  );

INSERT INTO KitchenPersonnel 
(FirstName, LastName, StaffRole, Certification, Phone, Email, HireDate, StationAssigned)
VALUES
('Lorianne', 'Upham', 'Bartender', 'Food Handler Permit', '900-345-7077', 'lupham0@php.net', '2024-12-31', 'Dish Pit'),
('Jemima', 'Bandt', 'Garde Manger', 'ServSafe Manager', '389-659-3745', 'jbandt1@live.com', '2025-03-25', 'Pastry'),
('Ethyl', 'Hancill', 'Pantry Cook', 'OSHA Kitchen Safety', '699-789-1607', 'ehancill2@xinhuanet.com', '2025-01-02', 'Cold Prep'),
('Lenard', 'Anthoney', 'Fryer Operator', 'Allergen Safety', '866-274-3597', 'lanthoney3@gizmodo.com', '2024-11-23', 'Garde Manger'),
('Vin', 'Grayne', 'Pantry Cook', 'ServSafe Manager', '895-597-4223', 'vgrayne4@clickbank.net', '2024-12-31', 'Saucier'),
('Liana', 'Golborn', 'Expediter', 'ServSafe Manager', '911-570-8741', 'lgolborn5@cam.ac.uk', '2025-04-16', 'Hot Line'),
('Minnie', 'Enriquez', 'Server', 'OSHA Kitchen Safety', '911-299-7890', 'menriquez6@globo.com', '2025-04-27', 'Expediting'),
('Vickie', 'Joll', 'Host', 'Allergen Safety', '604-185-2857', 'vjoll7@spiegel.de', '2025-08-31', 'Fryer'),
('Homer', 'Navarijo', 'Garde Manger', 'ServSafe Manager', '611-569-2640', 'hnavarijo8@microsoft.com', '2024-11-29', 'Grill'),
('Chris', 'Bruckenthal', 'Saucier', 'Allergen Safety', '381-986-2135', 'cbruckenthal9@uol.com.br', '2025-06-24', 'Fryer'),
('Wald', 'Cheyenne', 'Server', 'Food Handler Permit', '511-890-7185', 'wcheyennea@accuweather.com', '2025-09-03', 'Dish Pit'),
('Ammamaria', 'Winthrop', 'Saucier', 'Allergen Safety', '314-898-8752', 'awinthropb@cloudflare.com', '2025-02-07', 'Pantry'),
('Oliviero', 'Nornable', 'Server', 'ServSafe Manager', '794-341-4630', 'onornablec@sourceforge.net', '2024-12-16', 'Saucier'),
('Rahal', 'Corbert', 'Pantry Cook', 'Knife Safety Training', '287-499-4247', 'rcorbertd@netvibes.com', '2025-04-19', 'Dish Pit'),
('Dannye', 'Goadbie', 'Pastry Chef', 'HACCP Level 1', '130-784-2811', 'dgoadbiee@issuu.com', '2025-03-26', 'Saucier'),
('Tanny', 'Humbatch', 'Barback', 'Allergen Safety', '356-346-4549', 'thumbatchf@jimdo.com', '2025-03-22', 'Pantry'),
('Tomi', 'Benezeit', 'Bartender', 'HACCP Level 1', '253-274-0408', 'tbenezeitg@addtoany.com', '2025-10-23', 'Saucier'),
('Carlotta', 'Von Brook', 'Garde Manger', 'ServSafe Manager', '192-398-7952', 'cvonbrookh@cbsnews.com', '2025-09-18', 'Grill'),
('Ambur', 'Andries', 'Pastry Chef', 'HACCP Level 1', '595-356-6119', 'aandriesi@samsung.com', '2025-03-17', 'Dish Pit'),
('Addy', 'Defond', 'Bartender', 'Allergen Safety', '113-628-1916', 'adefondj@youtu.be', '2025-02-27', 'Hot Line'),
('Goraud', 'Olohan', 'Sous Chef', 'Allergen Safety', '716-879-0506', 'golohank@booking.com', '2025-01-20', 'Grill'),
('Irwin', 'Abrahmovici', 'Line Cook', 'ServSafe Manager', '324-663-2199', 'iabrahmovicil@discuz.net', '2025-05-23', 'Expediting'),
('Emmy', 'Schapero', 'Prep Cook', 'Allergen Safety', '141-579-4362', 'eschaperom@google.pl', '2024-12-19', 'Grill'),
('Marti', 'Fance', 'Sous Chef', 'ServSafe Manager', '206-512-5299', 'mfancen@netvibes.com', '2025-04-12', 'Pastry'),
('Bjorn', 'Lemmanbie', 'Pastry Chef', 'Knife Safety Training', '822-100-7576', 'blemmanbieo@netlog.com', '2024-12-06', 'Fryer'),
('Sosanna', 'Covotto', 'Saucier', 'OSHA Kitchen Safety', '623-947-7412', 'scovottop@facebook.com', '2025-02-08', 'Pantry'),
('Raynard', 'Gullivan', 'Fryer Operator', 'Food Handler Permit', '661-385-2462', 'rgullivanq@independent.co.uk', '2025-06-07', 'Cold Prep'),
('Nathanial', 'Silverwood', 'Sous Chef', 'Food Handler Permit', '949-415-5481', 'nsilverwoodr@meetup.com', '2025-04-25', 'Hot Line'),
('Drud', 'Castellone', 'Saucier', 'Food Handler Permit', '289-564-5028', 'dcastellones@vk.com', '2024-11-18', 'Pantry'),
('Jobi', 'Abadam', 'Expediter', 'HACCP Level 1', '611-578-9922', 'jabadamt@goo.gl', '2025-04-16', 'Pastry');


# Mockaroo random data selects failed to add executive chef to list so manually changed last data entry.

UPDATE KitchenPersonnel
SET StaffRole = 'Executive Chef',
    Certification = 'ServSafe Manager Certification',
    StationAssigned = 'Expediting'
WHERE StaffID = 30;

# First sub personnel table

CREATE TABLE PersonnelCompetencies (
    CompetencyID INT AUTO_INCREMENT PRIMARY KEY,
    StaffID INT NOT NULL,
    CompetencyName VARCHAR(100) NOT NULL, -- Skill or Certification name
    IsCertified BOOLEAN DEFAULT FALSE,
    IssuedDate DATE,                      -- Nullable if not certified
    ExpiryDate DATE,                      -- Nullable if not certified
    IssuingAuthority VARCHAR(100),       -- Nullable if not certified
    FOREIGN KEY (StaffID) REFERENCES KitchenPersonnel(StaffID)
);

INSERT INTO PersonnelCompetencies 
(StaffID, CompetencyName, IsCertified, IssuedDate, ExpiryDate, IssuingAuthority)
VALUES
(2, 'Saute', TRUE, '2020-04-03', '2026-06-02', 'OSHA'),
(30, 'OSHA Kitchen Safety', TRUE, '2020-12-04', '2026-11-15', 'State Health Dept'),
(27, 'OSHA Kitchen Safety', TRUE, '2023-04-22', '2026-07-20', 'ServSafe'),
(13, 'Pastry', FALSE, NULL, NULL, NULL),
(20, 'Pastry', FALSE, NULL, NULL, NULL),
(25, 'Saute', FALSE, NULL, NULL, NULL),
(17, 'Saute', FALSE, NULL, NULL, NULL),
(12, 'Food Handler Permit', TRUE, '2021-01-12', '2025-12-27', 'State Health Dept'),
(27, 'Saute', TRUE, '2022-06-21', '2025-02-16', 'State Health Dept'),
(14, 'OSHA Kitchen Safety', FALSE, NULL, NULL, NULL),
(5, 'Pastry', TRUE, '2020-08-12', '2026-01-13', 'Internal Training'),
(5, 'Pastry', FALSE, NULL, NULL, NULL),
(21, 'Pastry', TRUE, '2022-06-09', '2026-01-10', 'State Health Dept'),
(22, 'Pastry', TRUE, '2020-09-08', '2025-11-13', 'OSHA'),
(2, 'OSHA Kitchen Safety', FALSE, NULL, NULL, NULL),
(20, 'Knife Safety', TRUE, '2021-03-05', '2025-09-16', 'State Health Dept'),
(14, 'Pastry', FALSE, NULL, NULL, NULL),
(30, 'Pastry', TRUE, '2020-06-07', '2026-12-11', 'State Health Dept'),
(23, 'Food Handler Permit', FALSE, NULL, NULL, NULL),
(6, 'OSHA Kitchen Safety', TRUE, '2022-01-15', '2025-07-15', 'OSHA'),
(5, 'Saute', FALSE, NULL, NULL, NULL),
(30, 'Pastry', FALSE, NULL, NULL, NULL),
(1, 'Saute', TRUE, '2024-06-08', '2026-01-08', 'ServSafe'),
(22, 'OSHA Kitchen Safety', FALSE, NULL, NULL, NULL),
(18, 'Pastry', FALSE, NULL, NULL, NULL),
(24, 'OSHA Kitchen Safety', TRUE, '2021-10-24', '2025-02-20', 'ServSafe'),
(2, 'OSHA Kitchen Safety', FALSE, NULL, NULL, NULL),
(11, 'Pastry', TRUE, '2023-08-17', '2025-04-11', 'ServSafe'),
(17, 'Knife Safety', TRUE, '2021-07-02', '2024-10-30', 'Internal Training'),
(6, 'Pastry', TRUE, '2021-12-20', '2026-11-20', 'ServSafe');

# Second Sub personnel table

CREATE TABLE PersonnelSanitationLogs (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    StaffID INT NOT NULL,
    AreaCleaned VARCHAR(100),
    CleaningDate DATE,
    CleaningTime TIME,
    Notes TEXT,
    FOREIGN KEY (StaffID) REFERENCES KitchenPersonnel(StaffID)
);

INSERT INTO PersonnelSanitationLogs 
(StaffID, AreaCleaned, CleaningDate, CleaningTime, Notes)
VALUES
(11, 'Dry Storage', '2025-11-23', '00:35:27', 'Spot cleaned'),
(5, 'Dish Pit', '2025-11-01', '14:24:42', 'No visible debris'),
(6, 'Dish Pit', '2026-03-01', '18:15:57', 'Spot cleaned'),
(8, 'Saute Station', '2026-01-29', '22:45:15', 'Degreased thoroughly'),
(12, 'Dish Pit', '2026-06-07', '08:06:59', 'Logged in binder'),
(17, 'Walk-In Fridge', '2026-01-29', '09:52:27', 'Degreased thoroughly'),
(23, 'Dish Pit', '2025-10-10', '06:08:30', 'Logged in binder'),
(28, 'Dish Pit', '2026-03-16', '06:35:46', 'Degreased thoroughly'),
(20, 'Saute Station', '2025-08-17', '02:16:37', 'Used bleach solution'),
(15, 'Grill Station', '2026-04-03', '22:36:20', 'No visible debris'),
(10, 'Pantry', '2026-02-02', '03:10:20', 'No visible debris'),
(29, 'Walk-In Fridge', '2026-03-05', '09:38:51', 'Used bleach solution'),
(13, 'Dish Pit', '2025-09-13', '16:51:05', 'No visible debris'),
(3, 'Prep Counter', '2025-08-27', '01:27:13', 'Spot cleaned'),
(18, 'Dish Pit', '2025-03-10', '19:43:17', 'Logged in binder'),
(25, 'Saute Station', '2025-01-05', '09:58:36', 'Used bleach solution'),
(26, 'Prep Counter', '2025-04-05', '15:01:20', 'Wiped down with sanitizer'),
(12, 'Dry Storage', '2025-09-08', '18:57:31', 'Logged in binder'),
(27, 'Grill Station', '2024-11-14', '09:16:44', 'Wiped down with sanitizer'),
(7, 'Walk-In Fridge', '2025-02-20', '19:50:09', 'Used bleach solution'),
(1, 'Walk-In Fridge', '2026-04-12', '04:32:08', 'Spot cleaned'),
(17, 'Walk-In Fridge', '2026-06-21', '15:54:57', 'Degreased thoroughly'),
(25, 'Walk-In Fridge', '2025-05-31', '06:30:57', 'Wiped down with sanitizer'),
(22, 'Dish Pit', '2025-09-16', '10:42:41', 'Logged in binder'),
(7, 'Dish Pit', '2025-03-01', '00:20:04', 'No visible debris'),
(7, 'Walk-In Fridge', '2025-06-06', '01:34:53', 'Spot cleaned'),
(28, 'Dish Pit', '2025-08-02', '01:18:56', 'Degreased thoroughly'),
(16, 'Dish Pit', '2025-12-25', '02:12:33', 'Wiped down with sanitizer'),
(20, 'Dish Pit', '2026-06-27', '18:03:19', 'Spot cleaned'),
(4, 'Walk-In Fridge', '2025-06-15', '07:12:11', 'Used bleach solution'),
(26, 'Dish Pit', '2025-04-18', '05:20:47', 'No visible debris'),
(3, 'Grill Station', '2025-11-03', '13:08:16', 'Logged in binder'),
(29, 'Pantry', '2025-03-10', '23:47:50', 'Logged in binder'),
(6, 'Dish Pit', '2025-11-26', '16:47:46', 'Logged in binder'),
(17, 'Walk-In Fridge', '2026-03-03', '01:48:03', 'Degreased thoroughly'),
(26, 'Dish Pit', '2025-01-25', '08:51:19', 'Degreased thoroughly'),
(19, 'Dish Pit', '2026-05-18', '03:51:32', 'Spot cleaned'),
(24, 'Walk-In Fridge', '2025-06-10', '02:57:04', 'No visible debris'),
(14, 'Dish Pit', '2026-06-22', '13:57:11', 'Logged in binder'),
(13, 'Grill Station', '2026-03-19', '02:29:57', 'No visible debris'),
(24, 'Dry Storage', '2026-03-21', '09:05:00', 'Spot cleaned');


# third personnel sub table

CREATE TABLE PersonnelViolations (
    violationID INT AUTO_INCREMENT PRIMARY KEY,
    staffID INT NOT NULL,
    violationType VARCHAR(100),
    severityLevel ENUM('Low', 'Moderate', 'High'),
    description_violation_details TEXT,
    violationDate DATE NOT NULL,
    correctiveactiontaken BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (staffID) REFERENCES KitchenPersonnel(staffID)
);

INSERT INTO PersonnelViolations 
(staffID, violationType, severityLevel, description_violation_details, violationDate, correctiveactiontaken)
VALUES
(20, 'Unsafe Knife Use', 'Low', 'Observed handling raw meat without gloves', '2024-12-11', TRUE),
(29, 'Dress Code Violation', 'High', 'Improper footwear created a slip hazard', '2023-03-18', TRUE),
(27, 'Late Arrival', 'Low', 'Arrived 20 minutes late to scheduled shift', '2024-05-11', TRUE),
(27, 'Improper Food Handling', 'Low', 'Failed to wash hands after handling raw poultry', '2023-01-25', TRUE),
(8, 'Unsafe Knife Use', 'Low', 'Used knife improperly during prep, minor hazard', '2024-04-16', FALSE),
(9, 'Unsafe Knife Use', 'Low', 'Unsafe knife technique observed during lunch prep', '2023-02-05', TRUE),
(15, 'Missed Sanitation Log', 'High', 'Staff failed to log sanitation duties for dish pit', '2023-03-21', TRUE),
(4, 'Unsafe Knife Use', 'High', 'Observed handling raw meat without gloves', '2025-07-06', TRUE),
(20, 'Unsafe Knife Use', 'High', 'Repeated unsafe knife handling, corrective training scheduled', '2025-11-04', FALSE),
(14, 'Unsafe Knife Use', 'Low', 'Minor unsafe knife handling observed', '2024-04-20', FALSE),
(30, 'Late Arrival', 'Moderate', 'Arrived late, disrupted kitchen workflow', '2023-07-01', TRUE),
(14, 'Unsafe Knife Use', 'High', 'Observed unsafe knife handling during prep', '2024-08-12', FALSE),
(29, 'Improper Food Handling', 'Moderate', 'Failed to wash hands after handling raw poultry', '2026-09-10', TRUE),
(26, 'Missed Sanitation Log', 'Moderate', 'Sanitation duties not logged for grill station', '2024-11-01', FALSE),
(30, 'Improper Food Handling', 'Moderate', 'Did not follow safe food handling procedures', '2026-02-16', FALSE),
(18, 'Dress Code Violation', 'High', 'Improper attire created safety hazard', '2025-08-06', FALSE),
(26, 'Missed Sanitation Log', 'Low', 'Sanitation log incomplete for dish pit', '2026-03-14', TRUE),
(21, 'Improper Food Handling', 'Moderate', 'Observed handling raw meat without gloves', '2023-04-24', TRUE),
(4, 'Improper Food Handling', 'Moderate', 'Failed to wash hands after handling raw poultry', '2023-06-24', TRUE),
(20, 'Late Arrival', 'High', 'Arrived significantly late, corrective action required', '2026-04-02', FALSE),
(19, 'Unsafe Knife Use', 'Moderate', 'Unsafe knife technique observed during prep', '2023-12-13', FALSE),
(10, 'Unsafe Knife Use', 'High', 'Observed handling raw meat without gloves', '2023-09-01', TRUE),
(19, 'Late Arrival', 'High', 'Arrived late multiple times, disciplinary action taken', '2025-11-13', FALSE),
(5, 'Missed Sanitation Log', 'Low', 'Sanitation duties not logged for dry storage', '2026-07-08', FALSE),
(7, 'Late Arrival', 'Low', 'Arrived 10 minutes late to shift', '2025-01-13', TRUE),
(10, 'Unsafe Knife Use', 'Low', 'Unsafe knife handling observed during prep', '2024-02-07', FALSE),
(2, 'Dress Code Violation', 'High', 'Improper footwear created slip hazard', '2026-08-21', FALSE),
(3, 'Missed Sanitation Log', 'Moderate', 'Sanitation duties not logged for prep counter', '2024-04-14', FALSE),
(23, 'Missed Sanitation Log', 'Moderate', 'Sanitation duties not logged for walk-in fridge', '2025-12-21', TRUE),
(14, 'Late Arrival', 'Low', 'Arrived late to scheduled shift', '2026-07-12', FALSE),
(26, 'Late Arrival', 'Moderate', 'Arrived late, corrective coaching provided', '2025-07-11', TRUE);




# Consumables Table code Completed by Evalyn. Check constraints added to Consumable_quantity & Consumable_calories
# expanded Consumable_allergen to VARCHAR (50) for flexibility.

CREATE TABLE Consumables (
	consumable_id INT AUTO_INCREMENT PRIMARY KEY,
	consumable_name VARCHAR(50),
	consumable_expiration_date DATE,
	consumable_initial_date DATE, -- date when consumable arrives to restaurant
	consumable_quantity INT CHECK (Consumable_quantity >= 0),
	consumable_price DECIMAL(9,2),
	consumable_calories INT CHECK (Consumable_calories >= 0),
	consumable_allergen VARCHAR(50)
);


INSERT INTO Consumables 
(consumable_name, consumable_expiration_date, consumable_initial_date, consumable_quantity, consumable_price, consumable_calories, consumable_allergen)
VALUES
('Chicken', '2025-11-10', '2025-10-31', 10, 5.99, 165, 'none'),
('Beef', '2025-11-12', '2025-10-30', 8, 6.49, 250, 'none'),
('Pork', '2025-11-08', '2025-10-29', 6, 5.29, 242, 'none'),
('Salmon', '2025-11-05', '2025-10-31', 4, 9.99, 208, 'fish'),
('Shrimp', '2025-11-06', '2025-10-30', 5, 12.49, 99, 'shellfish'),
('Bacon', '2025-11-15', '2025-10-28', 7, 4.99, 43, 'none'),
('Lobster', '2025-11-04', '2025-10-31', 3, 19.99, 89, 'shellfish'),
('Ground beef', '2025-11-09', '2025-10-30', 10, 5.79, 270, 'none'),
('Cream cheese', '2025-11-20', '2025-10-25', 6, 3.49, 99, 'dairy'),
('Mozzarella', '2025-11-18', '2025-10-27', 5, 4.29, 85, 'dairy'),
('Parmesan', '2025-12-01', '2025-10-26', 4, 6.99, 110, 'dairy'),
('Ricotta', '2025-11-22', '2025-10-28', 3, 3.99, 174, 'dairy'),
('Goat cheese', '2025-11-25', '2025-10-29', 2, 5.49, 103, 'dairy'),
('Sour cream', '2025-11-19', '2025-10-30', 4, 2.99, 60, 'dairy'),
('Butter', '2025-12-05', '2025-10-25', 6, 3.79, 102, 'dairy'),
('Milk', '2025-11-07', '2025-10-31', 8, 2.49, 150, 'dairy'),
('Heavy cream', '2025-11-10', '2025-10-30', 3, 3.99, 52, 'dairy'),
('Spinach', '2025-11-03', '2025-10-31', 5, 1.99, 23, 'none'),
('Artichoke hearts', '2025-12-10', '2025-10-30', 2, 4.59, 60, 'none'),
('Mushrooms', '2025-11-06', '2025-10-31', 6, 2.49, 22, 'none'),
('Tomatoes', '2025-11-05', '2025-10-31', 10, 1.89, 18, 'none'),
('Basil', '2025-11-15', '2025-10-30', 3, 1.29, 5, 'none'),
('Garlic', '2025-12-01', '2025-10-29', 4, 0.99, 4, 'none'),
('Onions', '2025-11-20', '2025-10-28', 7, 1.49, 40, 'none'),
('Carrots', '2025-11-10', '2025-10-31', 6, 1.29, 25, 'none'),
('Celery', '2025-11-08', '2025-10-30', 5, 1.19, 16, 'none'),
('Bell peppers', '2025-11-09', '2025-10-31', 6, 1.99, 30, 'none'),
('Asparagus', '2025-11-07', '2025-10-30', 4, 3.49, 20, 'none'),
('Zucchini', '2025-11-06', '2025-10-31', 5, 1.79, 17, 'none'),
('Potatoes', '2025-12-15', '2025-10-25', 10, 2.49, 130, 'none'),
('Lettuce', '2025-11-03', '2025-10-31', 5, 1.49, 15, 'none'),
('Cabbage', '2025-11-10', '2025-10-30', 4, 1.29, 22, 'none'),
('Ginger', '2025-12-01', '2025-10-29', 3, 2.99, 80, 'none'),
('Scallions', '2025-11-05', '2025-10-31', 6, 1.19, 32, 'none'),
('Dates', '2025-12-15', '2025-10-25', 5, 4.99, 277, 'none'),
('Apples', '2025-11-20', '2025-10-30', 8, 0.99, 95, 'none'),
('Lemons', '2025-11-25', '2025-10-29', 6, 0.89, 17, 'none'),
('Berries (mixed)', '2025-11-07', '2025-10-31', 4, 3.99, 70, 'none'),
('Vanilla beans', '2026-01-01', '2025-10-25', 2, 6.99, 12, 'none'),
('Flour', '2026-03-01', '2025-10-25', 10, 2.49, 455, 'gluten'),
('Sugar', '2026-04-01', '2025-10-25', 10, 1.99, 387, 'none'),
('Brown sugar', '2026-04-01', '2025-10-25', 8, 2.29, 400, 'none'),
('Cocoa powder', '2026-02-01', '2025-10-25', 5, 3.49, 196, 'none'),
('Coffee', '2026-05-01', '2025-10-25', 6, 4.99, 2, 'none'),
('Ladyfingers', '2025-12-01', '2025-10-25', 4, 3.99, 120, 'gluten'),
('Breadcrumbs', '2026-01-01', '2025-10-25', 5, 2.49, 110, 'gluten'),
('Panko', '2026-01-01', '2025-10-25', 5, 2.99, 118, 'gluten'),
('Lasagna noodles', '2026-03-01', '2025-10-25', 6, 3.49, 210, 'gluten'),
('Pasta', '2026-03-01', '2025-10-25', 10, 2.99, 200, 'gluten'),
('Arborio rice', '2026-04-01', '2025-10-25', 5, 4.49, 170, 'none'),
('Bread (baguette)', '2025-11-05', '2025-10-31', 4, 2.99, 250, 'gluten'),
('Spring roll wrappers', '2025-12-01', '2025-10-25', 3, 3.49, 100, 'gluten'),
('Olive oil', '2026-06-01', '2025-10-25', 2, 6.99, 119, 'none'),
('Balsamic vinegar', '2026-06-01', '2025-10-25', 2, 5.49, 14, 'none'),
('Soy sauce', '2026-05-01', '2025-10-25', 3, 3.99, 10, 'soy'),
('Red wine', '2026-12-01', '2025-10-25', 2, 9.99, 125, 'none'),
('Apple cider', '2025-12-01', '2025-10-25', 3, 4.99, 120, 'none'),
('Honey', '2026-07-01', '2025-10-25', 2, 5.99, 64, 'none'),
('Dijon mustard', '2026-01-01', '2025-10-25', 2, 3.49, 15, 'none'),
('Marsala wine', '2026-12-01', '2025-10-25', 2, 8.99, 140, 'none'),
('Truffle oil', '2026-06-01', '2025-10-25', 1, 12.99, 120, 'none'),
('Capers', '2026-01-01', '2025-10-25', 2, 3.99, 2, 'none'),
('Rosemary', '2025-12-01', '2025-10-25', 3, 1.99, 5, 'none'),
('Thyme', '2025-12-01', '2025-10-25', 3, 1.99, 5, 'none'),
('Oregano', '2025-12-01', '2025-10-25', 3, 1.99, 5, 'none'),
('Dill', '2025-12-01', '2025-10-25', 3, 1.99, 5, 'none'),
('Parsley', '2025-12-01', '2025-10-25', 3, 1.99, 5, 'none'),
('Cinnamon', '2026-01-01', '2025-10-25', 2, 2.99, 6, 'none'),
('Nutmeg', '2026-01-01', '2025-10-25', 2, 2.99, 12, 'none'),
('Salt', '2026-12-01', '2025-10-25', 5, 0.99, 0, 'none'),
('Black pepper', '2026-12-01', '2025-10-25', 5, 1.49, 0, 'none'),
('Red pepper flakes', '2026-12-01', '2025-10-25', 5, 1.49, 6, 'none'),
('Eggs', '2025-11-10', '2025-10-31', 12, 2.99, 70, 'egg'),
('Baking powder', '2026-03-01', '2025-10-25', 2, 1.99, 0, 'none'),
('Baking soda', '2026-03-01', '2025-10-25', 2, 1.49, 0, 'none'),
('Graham crackers', '2025-12-01', '2025-10-25', 4, 3.49, 130, 'gluten'),
('Powdered sugar', '2026-04-01', '2025-10-25', 5, 2.49, 400, 'none'),
('Cocoa', '2026-02-01', '2025-10-25', 4, 3.49, 196, 'none'),
('Mascarpone', '2025-11-20', '2025-10-30', 2, 4.99, 120, 'dairy'),
('Ice cream (vanilla)', '2025-11-30', '2025-10-25', 3, 5.49, 207, 'dairy'),
('Macaroni', '2026-03-01', '2025-10-25', 6, 2.99, 210, 'gluten'),
('Cheddar cheese', '2025-11-25', '2025-10-30', 5, 4.49, 113, 'dairy');

# Added auto increment and primary key to Recipe_id. changed ingredients to text. 
# Renamed Category from Catagory. Added Recipe_creation_date, Recipe_difficulty_level. 
# Added StaffID as foreign key to link to Kitchen_Personnel table. 

CREATE TABLE Recipe_Table (
  recipe_id INT AUTO_INCREMENT PRIMARY KEY,
  recipe_name VARCHAR(83) NOT NULL,
  ingredients TEXT,
  category VARCHAR(20),
  recipe_creation_date DATE,
  recipe_difficulty_level VARCHAR(20),
  staffID INT,
  FOREIGN KEY (staffID) REFERENCES KitchenPersonnel(staffID)
);

INSERT INTO Recipe_Table 
(recipe_name, ingredients, category, recipe_creation_date, recipe_difficulty_level, staffID) VALUES
('Surf and Turf Platter1', 'Berries (mixed)', 'Entree', '2023-10-28', 'easy', 1),
('Tiramisu1', 'Dates', 'Appetizer', '2022-03-23', 'medium', 2),
('Bacon-Wrapped Dates', 'Heavy cream', 'Special', '2025-05-13', 'easy', 3),
('Crispy Spring Rolls', 'Cheddar cheese', 'Dessert', '2023-11-20', 'hard', 4),
('Herb-Roasted Chicken1', 'Nutmeg', 'Entree', '2025-10-23', 'medium', 5),
('New York Cheesecake', 'Sugar', 'Appetizer', '2025-07-29', 'easy', 6),
('Mushroom Risotto1', 'Ricotta', 'Special', '2023-12-03', 'medium', 7),
('Mushroom Risotto2', 'Ground beef', 'Dessert', '2023-08-03', 'easy', 8),
('Stuffed Mushroom Caps1', 'Lobster', 'Entree', '2025-09-22', 'medium', 9),
('Spinach Artichoke Dip', 'Berries (mixed)', 'Appetizer', '2023-12-22', 'easy', 10),
('Herb-Roasted Chicken2', 'Tomatoes', 'Special', '2024-07-26', 'medium', 11),
('Tiramisu2', 'Bread (baguette)', 'Dessert', '2025-04-02', 'medium', 12),
('Vegetable Lasagna', 'Truffle oil', 'Entree', '2024-11-21', 'hard', 13),
('Shrimp Scampi Pasta', 'Oregano', 'Appetizer', '2023-02-22', 'hard', 14),
('Tiramisu3', 'Lettuce', 'Special', '2022-06-20', 'easy', 15),
('Herb-Roasted Chicken3', 'Apple cider', 'Dessert', '2022-07-16', 'easy', 16),
('Stuffed Mushroom Caps2', 'Arborio rice', 'Entree', '2022-07-13', 'hard', 17),
('Surf and Turf Platter', 'Mozzarella', 'Appetizer', '2024-05-04', 'medium', 18),
('Pork Tenderloin with Apple Glaze', 'Onions', 'Special', '2024-08-13', 'easy', 19),
('Tiramisu4', 'Butter', 'Dessert', '2023-06-05', 'medium', 20),
('Stuffed Mushroom Caps3', 'Arborio rice', 'Entree', '2025-09-18', 'easy', 21),
('Stuffed Mushroom Caps4', 'Celery', 'Appetizer', '2022-04-18', 'medium', 22),
('Pork Tenderloin with Apple Glaze', 'Balsamic vinegar', 'Special', '2022-09-29', 'hard', 23),
('Surf and Turf Platter2', 'Sour cream', 'Dessert', '2023-03-31', 'easy', 24),
('Surf and Turf Platter3', 'Vanilla beans', 'Entree', '2023-09-12', 'easy', 25),
('Chef''s Seasonal Special (changes weekly)', 'Cheddar cheese', 'Appetizer', '2022-03-14', 'easy', 26),
('Bruschetta with Tomato Basil', 'Potatoes', 'Special', '2024-03-17', 'hard', 27),
('Herb-Roasted Chicken4', 'Graham crackers', 'Dessert', '2023-09-11', 'hard', 28),
('Vegetable Lasagna', 'Bacon', 'Entree', '2022-09-13', 'hard', 29),
('Apple Pie with Vanilla Ice Cream', 'Arborio rice', 'Appetizer', '2025-01-20', 'hard', 30);


# Supplier table creation by Tijan
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100),
    contact_person VARCHAR(100),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(255),
    city VARCHAR(50),
    country VARCHAR(50),
    delivery_days VARCHAR(50)
);

INSERT INTO Suppliers 
(supplier_name, contact_person, phone_number, email, address, city, country, delivery_days)
VALUES
('Supplier A','Alice','+1-425-888-1001','alice@sonko.com','120 Greenway Blvd','Seattle','USA','Mon, Thu'),
('Supplier B','Bob','+1-206-777-2323','bob@etallinding.com','57 Harbor Road','Tacoma','USA','Tue, Fri'),
('Supplier C','Cara','+1-360-555-7483','cara@tijan.com','14 Riverbend Ave','Portland','USA','Wed, Sat'),
('Supplier D','Dan','+1-509-333-9021','dan@yahoo.com','202 Milk Lane','Spokane','USA','Mon, Wed, Fri'),
('Supplier E','Eve','+44-20-4455-2201','eve@gmail.com','45 Kings Market St','London','UK','Tue, Thu'),
('Supplier F','Finn','+1-305-901-8877','finn@something.com','89 Palm Street','Miami','USA','Mon, Thu, Sat'),
('Supplier G','Gina','+1-613-432-2309','gina@ottaw.com','302 Maple Grove Rd','Ottawa','Canada','Wed, Fri'),
('Supplier H','Hank','+49-30-7789-440','hank@gambia.com','19 Berliner Strasse','Berlin','Germany','Tue, Fri'),
('Supplier K','Kenji','+81-3-7789-1122','kenji@osakatrade.jp','55 Umeda St','Osaka','Japan','Mon, Thu'),
('Supplier I','Ivy','+27-11-305-6577','ivy@senegal.com','67 Market Way','Johannesburg','South Africa','Thu, Sun'),
('Supplier L','Lars','+46-8-4455-7788','lars@stockholmfoods.se','88 Baltic Ave','Stockholm','Sweden','Tue, Fri'),
('Supplier J','Jae','+65-6221-8009','jae@sonko.com','25 Orchard Road','Singapore City','Singapore','Mon, Wed, Fri'),
('Supplier M','Marta','+34-91-778-3300','marta@madridimports.es','12 Gran Via','Madrid','Spain','Wed, Sat'),
('Supplier N','Karl','+41-21-388-97754','karl@zurichem.com','78 Lakeview Blvd','Zurich','Switzerland','Tue, Thu'),
('Supplier O','Lena','+47-61-277-4339','lena@oslofoods.com','142 Fjord Avenue','Oslo','Norway','Mon, Wed, Fri'),
('Supplier P','Mona','+972-44-088-812','mona@telavivtraders.com','56 Palm Grove','Tel Aviv','Israel','Wed, Sat'),
('Supplier Q','Noah','+358-55-523-11','noah@helsinkitech.com','300 Baltic Road','Helsinki','Finland','Mon, Thu'),
('Supplier R','Omar','+81-3-992-4777','omar@tokyotrade.co.jp','99 Sakura Lane','Tokyo','Japan','Tue, Fri'),
('Supplier S','Paula','+39-02-8844-201','paula@milanosupply.it','210 Via Roma','Milan','Italy','Wed, Sat'),
('Supplier T','Quinn','+33-1-4255-9899','quinn@parismart.fr','80 Rue des Champs','Paris','France','Tue, Thu'),
('Supplier U','Ravi','+91-22-2337-118','ravi@mumbaiimports.in','33 Gateway Plaza','Mumbai','India','Mon, Wed, Fri'),
('Supplier V','Sara','+61-2-9987-342','sara@sydneygoods.au','78 Harbor View','Sydney','Australia','Wed, Fri'),
('Supplier W','Tariq','+971-50-993-3882','tariq@dubaitrade.ae','88 Creek Street','Dubai','UAE','Tue, Fri'),
('Supplier X','Uma','+351-21-177-8300','uma@lisbonsupply.pt','27 Avenida Mar','Lisbon','Portugal','Mon, Thu, Sat'),
('Supplier Y','Victor','+55-11-9900-7231','victor@rioprod.com','64 Copacabana Blvd','Rio de Janeiro','Brazil','Wed, Sat'),
('Supplier Z','Wendy','+86-10-8155-2339','wendy@beijingexport.cn','22 Dragon Road','Beijing','China','Thu, Sun'),
('Supplier AA','Xavier','+48-22-433-1001','xavier@warsawtrade.pl','10 Vistula St','Warsaw','Poland','Mon, Wed, Fri'),
('Supplier AB','Yara','+20-23-349-211','yara@cairofresh.eg','48 Nile View','Cairo','Egypt','Tue, Thu'),
('Supplier AC','Zane','+27-61-332-2011','zane@capetownlogistics.za','103 Table Bay Rd','Cape Town','South Africa','Wed, Fri'),
('Supplier AD','Ava','+234-809-443-2211','ava@lagosglobal.ng','45 Marina Avenue','Lagos','Nigeria','Mon, Wed, Fri'),
('Supplier AE','Ben','+44-1209-776-554','ben@manchesterfoods.uk','14 Riverbend St','Manchester','UK','Tue, Fri'),
('Supplier AF','Clara','+1-416-554-4322','clara@torontosupply.ca','21 Maple Avenue','Toronto','Canada','Thu, Sun'),
('Supplier AG','Dylan','+1-212-555-0933','dylan@newyorktrade.us','500 Madison Street','New York','USA','Mon, Wed, Fri');

# Junction table created to track which consumables used in which recipes
# wich suppliers provide what consumables

CREATE TABLE Recipe_Consumables_Suppliers (
  recipe_id INT,
  consumable_id INT,
  supplier_id INT,
  quantity_used DECIMAL(10,2),
  supply_price DECIMAL(10,2),
  PRIMARY KEY (recipe_id, consumable_id, supplier_id),
  FOREIGN KEY (recipe_id) REFERENCES Recipe_Table(Recipe_id),
  FOREIGN KEY (consumable_id) REFERENCES Consumables(consumable_id),
  FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

# Inserting data into table

INSERT INTO Recipe_Consumables_Suppliers 
(recipe_id, consumable_id, supplier_id, quantity_used, supply_price)
VALUES
(1, 2, 1, 1.50, 3.25),    -- Surf and Turf Platter1 → Berries (mixed)
(2, 6, 3, 0.75, 2.10),    -- Tiramisu1 → Dates
(3, 10, 5, 1.00, 2.50),   -- Bacon-Wrapped Dates → Heavy cream
(4, 12, 4, 1.25, 3.00),   -- Crispy Spring Rolls → Cheddar cheese
(5, 23, 18, 0.50, 1.75),  -- Herb-Roasted Chicken1 → Nutmeg
(6, 27, 21, 1.50, 2.80),  -- New York Cheesecake → Sugar
(7, 28, 22, 2.00, 4.50),  -- Mushroom Risotto1 → Ricotta
(8, 13, 8, 1.00, 3.20),   -- Mushroom Risotto2 → Ground beef
(9, 29, 23, 1.25, 5.00),  -- Stuffed Mushroom Caps1 → Lobster
(10, 2, 1, 0.75, 1.90),   -- Spinach Artichoke Dip → Berries (mixed)
(11, 12, 7, 1.25, 3.40),  -- Herb-Roasted Chicken2 → Tomatoes
(12, 30, 24, 1.50, 2.70), -- Tiramisu2 → Bread (baguette)
(13, 16, 11, 2.00, 5.00), -- Vegetable Lasagna → Truffle oil
(14, 31, 25, 1.25, 3.80), -- Shrimp Scampi Pasta → Oregano
(15, 25, 20, 1.00, 2.40), -- Tiramisu3 → Lettuce
(16, 32, 26, 1.50, 4.60), -- Herb-Roasted Chicken3 → Apple cider
(17, 8, 3, 1.50, 4.20),   -- Stuffed Mushroom Caps2 → Arborio rice
(18, 20, 15, 1.25, 4.00), -- Surf and Turf Platter → Mozzarella
(19, 33, 27, 1.00, 2.50), -- Pork Tenderloin with Apple Glaze → Onions
(20, 34, 28, 1.25, 3.20), -- Tiramisu4 → Butter
(21, 8, 3, 1.50, 4.20),   -- Stuffed Mushroom Caps3 → Arborio rice
(22, 35, 29, 1.00, 2.10), -- Stuffed Mushroom Caps4 → Celery
(23, 36, 30, 0.75, 2.90), -- Pork Tenderloin with Apple Glaze → Balsamic vinegar
(24, 37, 31, 1.25, 3.60), -- Surf and Turf Platter2 → Sour cream
(25, 21, 16, 0.75, 2.90), -- Surf and Turf Platter3 → Vanilla beans
(26, 12, 4, 1.25, 3.00),  -- Chef’s Seasonal Special → Cheddar cheese
(27, 38, 32, 1.00, 2.20), -- Bruschetta with Tomato Basil → Potatoes
(28, 39, 33, 1.50, 4.50), -- Herb-Roasted Chicken4 → Graham crackers
(29, 40, 34, 1.25, 3.80), -- Vegetable Lasagna → Bacon
(30, 8, 3, 1.50, 4.20);   -- Apple Pie with Vanilla Ice Cream → Arborio rice