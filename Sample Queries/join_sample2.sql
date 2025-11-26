-- What the query returns
-- For each recipe, the result set includes:
-- `Recipe_name` → the name of the recipe  
-- `consumable_name` → the ingredient/consumable used  
-- `supplier_name` → the supplier providing that consumable  
-- `Category` → recipe category (e.g., entree, dessert)  
-- `Recipe_difficulty_level` → difficulty rating of the recipe  
-- `quantity_used` → amount of the consumable used in the recipe  
-- `supply_price` → price of the consumable from the supplier  

-- Ordering
-- The results are sorted alphabetically by `Recipe_name`.


-- **Purpose:**  
-- This query is designed to produce a consolidated view of recipes, their required consumables, 
-- and the suppliers providing those consumables, along with usage and cost details. 
-- It supports audit-friendly reporting and supply chain validation.

SELECT r.Recipe_name,
       c.consumable_name,
       s.supplier_name,
       r.Category,
       r.Recipe_difficulty_level,
       rs.quantity_used,
       rs.supply_price
FROM Recipe_Table r
JOIN Recipe_Consumables_Suppliers rs ON r.Recipe_id = rs.recipe_id
JOIN Consumables c ON rs.consumable_id = c.consumable_id
JOIN Suppliers s ON rs.supplier_id = s.supplier_id
ORDER BY r.Recipe_name;
