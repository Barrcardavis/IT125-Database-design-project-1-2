create database tijan;
 use tijan;



CREATE TABLE suppliers (
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

INSERT INTO suppliers (
  supplier_name, contact_person, phone_number, email, address, city, country, delivery_days
) VALUES
('Supplier A','Alice','4258881001','s1@sonko.com','120 Greenway Blvd','Seattle','USA','MonThu'),
('Supplier B','Bob','2067772323','s2@etallinding.com','57 Harbor Road','Tacoma','USA','TueFri'),
('Supplier C','Cara','3605557483','s3@tijan.com','14 Riverbend Ave','Portland','USA','WedSat'),
('Supplier D','Dan','5093339021','s4@yahoo.com','202 Milk Lane','Spokane','USA','MonWedFri'),
('Supplier E','Eve','442044552201','s5@gmail.com','45 Kings Market St','London','UK','TueThu'),
('Supplier F','Finn','3059018877','s6@something.com','89 Palm Street','Miami','USA','MonThuSat'),
('Supplier G','Gina','6134322309','s7@ottaw.com','302 Maple Grove Rd','Ottawa','Canada','WedFri'),
('Supplier H','Hank','49307789440','s8@gambia.com','19 Berliner Strasse','Berlin','Germany','TueFri'),
('Supplier I','Ivy','27113056577','s9@senegal.com','67 Market Way','Johannesburg','South Africa','ThuSun'),
('Supplier J','Jae','6562218009','s10@sonko.com','25 Orchard Road','Singapore City','Singapore','MonWedFri');

select * from suppliers;

