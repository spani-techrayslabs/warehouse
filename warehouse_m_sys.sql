CREATE DATABASE Management;
USE Management;
CREATE TABLE warehouse(
warehouse_id INT PRIMARY KEY,
managed_by VARCHAR(50), 
Country VARCHAR(80),
role_id int,
FOREIGN KEY (role_id) REFERENCES role (role_id)
);
drop table warehouse;
INSERT INTO warehouse VALUES (101, "TOM", "SWITZERLAND", 1);
INSERT INTO warehouse VALUES (102, "JERRY", "POLAND" , 3);
INSERT INTO warehouse VALUES (103, "Mary", "INDIA", 3);
INSERT INTO warehouse VALUES (104, "Chloe", "AMERICA", 3);
INSERT INTO warehouse VALUES (105, "Santa", "GREENLAND", 2);
INSERT INTO warehouse VALUES (106, "Chris", "AFRICA", 2);

SELECT * FROM warehouse;

CREATE TABLE role(
role_id INT PRIMARY KEY,
role_name VARCHAR(50)
);
INSERT INTO role VALUES (1, "Admin");
INSERT INTO role VALUES (2, "user");
INSERT INTO role VALUES (3, "Manager");

SELECT * FROM role;

CREATE TABLE zone(
zone_id INT PRIMARY KEY,
warehouse_id INT,
zone_type VARCHAR(50),
FOREIGN KEY (warehouse_id) REFERENCES warehouse(warehouse_id)


);
drop table zone;
INSERT INTO zone VALUES (1, 103, "inbound");
INSERT INTO zone VALUES (2, 102, "storage");
INSERT INTO zone VALUES (3, 101, "picking");
INSERT INTO zone VALUES (4, 104, "inbound");
INSERT INTO zone VALUES (5, 105, "storage");
SELECT * FROM zone;



ALTER TABLE warehouse 
CHANGE COLUMN Location Country VARCHAR(80);

ALTER TABLE warehouse 
CHANGE COLUMN name Owners VARCHAR(50);

CREATE TABLE Product(
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
catagory VARCHAR(50),
unit INT
);
INSERT INTO Product (product_id, product_name, catagory, unit)
VALUES
    (1, 'wireless mouse', 'electronics', 500),
    (2, 'wireless keyboard', 'electronics', 650),
    (3, 'printer', 'electronics', 790);

SELECT * FROM Product;

DROP TABLE Supplier;

CREATE TABLE Supplier(
supplier_id INT PRIMARY KEY,
supplier_name VARCHAR(50),
phone_no BIGINT
);
INSERT INTO Supplier (supplier_id, supplier_name, phone_no)
VALUES
    (501, 'techrayslabs pvt', 6567576796),
    (502, 'tech supplies ltd', 7658769095),
    (503, 'shopify', 79778968);

SELECT * FROM Supplier;

CREATE TABLE Purchase_order(
purchase_id INT PRIMARY KEY,
supplier_id INT,
Status VARCHAR(40),
FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);
INSERT INTO Purchase_order (Purchase_id, supplier_id, Status)
VALUES
    (001, 501, 'recieved'),
    (002, 502, 'recieved'),
    (003, 503, 'recieved');
    
     

SELECT * FROM Purchase_order;
ALTER TABLE Purchase_order
DROP COLUMN product_id;

SELECT *
FROM Supplier
inner join Purchase_order
ON Supplier.supplier_id = Purchase_order.supplier_id
;

CREATE TABLE Purchase_order_item(
order_id INT PRIMARY KEY,
product_id INT,
purchase_id INT,
order_qnt INT,
FOREIGN KEY (purchase_id) REFERENCES Purchase_order(purchase_id),
FOREIGN KEY (product_id) REFERENCES Product(product_id)


);
ALTER  TABLE Purchase_order_item
DROP COLUMN ordered_item;

DROP TABLE Purchase_order_item;


INSERT INTO Purchase_order_item (order_id, product_id, purchase_id, order_qnt)
VALUES
    (1, 1, 001, 234),
    (2, 2, 002, 344),
    (3, 3, 003, 432);
SELECT * FROM Purchase_order_item;
drop table Purchase_order_item;


CREATE TABLE Picking_task (
    picking_id INT PRIMARY KEY,
    status VARCHAR(50),
    sales_id INT,
    FOREIGN KEY (sales_id) REFERENCES sales_order (sales_id)
);
drop table Picking_task;

SELECT * FROM Picking_task;
CREATE TABLE Shipment(
shipment_id INT PRIMARY KEY,
carrier VARCHAR(50),
tracking VARCHAR(50)

);
CREATE TABLE sales_order(
    sales_id INT PRIMARY KEY,
    status VARCHAR(50)
);
CREATE TABLE Inventory(
inventory_id INT PRIMARY KEY,
zone_id INT,
product_id INT,
quantity INT,
FOREIGN KEY (product_id) REFERENCES Product(product_id),
FOREIGN KEY (zone_id) REFERENCES zone(zone_id)

);
drop table Inventory;
INSERT INTO Inventory VALUES
(301, 2, 1, 900),
(302, 1, 2, 900),
(303, 3, 3, 900);
SELECT * FROM Inventory;


SHOW TABLES;






