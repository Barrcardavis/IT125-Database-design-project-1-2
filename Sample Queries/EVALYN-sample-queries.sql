-- ==========================================================
-- Week 9 Quarterly Database Project Part 3 - SQL Scripts
-- NAME: Evalyn Alviar
-- DATE: 2025-11-18
-- ==========================================================
USE Grouped_Health_Inspect_KitchenDB;

-- Simple view of all consumables
CREATE VIEW consumable_list AS
SELECT Consumable_id, Consumable_name, Consumable_quantity, Consumable_calories
FROM consumables;
-- testing view:
SELECT * FROM consumable_list LIMIT 50;

-- View showing recipes along with consumable allergens
CREATE VIEW recipe_consumable_view AS 
SELECT Recipe_id, Recipe_name, Ingredients, Consumable_allergen
FROM recipe_table
	JOIN consumables USING(Recipe_id);
-- testing view:
SELECT * FROM recipe_consumable_view LIMIT 5;

-- created an index on consumables.Consumable_name
CREATE INDEX idx_consumable_name ON consumables(Consumable_name);

-- created a composite index on consumables.Recipe_id and Consumable_expiration_date
CREATE INDEX idx_recipe_expiration ON consumables(Recipe_id, Consumable_expiration_date);
