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
