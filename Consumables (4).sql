CREATE TABLE Consumables (
Consumable_id INT AUTO_INCREMENT PRIMARY KEY, 
Consumable_expiration_date DATE,
Consumable_initial_date DATE, 					-- date when consumable arrives to resturant
Consumable_quantity INT,
Consumable_price DECIMAL (6,2) CHECK (Consumable_price >= 0),
Consumable_calories INT,
Consumable_allergen VARCHAR(10) NOT NULL
);

insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (1, '2023-05-27', '2025-07-12', 432, 8383.35, 4133, 'dairy');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (2, '2023-03-13', '2023-09-28', 673, 2817.27, 3701, 'gluten');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (3, '2023-01-15', '2025-09-13', 243, 9752.8, 4032, 'dairy');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (4, '2023-08-15', '2025-11-25', 238, 4058.85, 1540, 'peanuts');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (5, '2025-05-09', '2022-04-25', 528, 7472.43, 581, 'gluten');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (6, '2024-02-06', '2025-11-13', 271, 7097.55, 4363, 'gluten');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (7, '2023-01-25', '2022-03-27', 210, 3558.79, 228, 'peanuts');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (8, '2022-05-05', '2024-02-26', 670, 2020.34, 4518, 'soy');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (9, '2023-05-30', '2025-06-24', 419, 3340.94, 1840, 'shellfish');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (10, '2024-03-13', '2022-09-18', 297, 5049.79, 1158, 'dairy');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (11, '2025-06-19', '2022-08-17', 282, 905.44, 3683, 'soy');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (12, '2024-12-14', '2024-03-17', 719, 5895.56, 2118, 'gluten');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (13, '2023-12-20', '2022-04-22', 923, 6518.69, 1064, 'shellfish');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (14, '2023-01-16', '2025-08-03', 841, 6421.55, 2208, 'soy');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (15, '2022-10-18', '2023-03-15', 644, 9874.54, 1416, 'dairy');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (16, '2022-07-24', '2024-07-02', 996, 3305.75, 683, 'gluten');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (17, '2025-02-20', '2025-06-27', 222, 4019.71, 2192, 'peanuts');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (18, '2025-04-13', '2025-08-30', 674, 4969.26, 1383, 'peanuts');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (19, '2023-07-12', '2024-08-29', 981, 5795.28, 2230, 'soy');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (20, '2024-03-14', '2025-05-22', 769, 364.29, 1445, 'peanuts');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (21, '2024-08-04', '2023-02-24', 392, 4500.12, 2550, 'shellfish');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (22, '2023-03-31', '2022-09-27', 276, 9499.97, 1477, 'gluten');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (23, '2023-04-24', '2024-03-24', 45, 9785.94, 1779, 'gluten');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (24, '2022-11-22', '2024-10-09', 800, 5743.18, 2064, 'soy');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (25, '2023-09-16', '2023-01-17', 540, 8841.67, 1672, 'shellfish');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (26, '2023-09-23', '2024-01-11', 610, 143.54, 2853, 'dairy');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (27, '2022-09-30', '2022-07-27', 28, 4369.52, 2765, 'dairy');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (28, '2025-03-16', '2025-08-28', 430, 2026.55, 1112, 'soy');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (29, '2023-11-20', '2025-02-03', 373, 1735.69, 3824, 'peanuts');
insert into Consumables (Consumable_id, Consumable_expiration_date, Consumable_initial_date, Consumable_quantity, Consumable_price, Consumable_calories, Consumable_allergen) values (30, '2024-01-14', '2023-11-01', 716, 3228.39, 1786, 'dairy');
