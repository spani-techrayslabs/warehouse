CREATE DATABASE Management;
USE Management;
CREATE TABLE warehouse(
warehouse_id INT PRIMARY KEY,
name VARCHAR(50),
Country VARCHAR(80)
);

INSERT INTO warehouse VALUES (101, "TOM", "SWITZERLAND");
INSERT INTO warehouse VALUES (102, "JERRY", "POLAND");
INSERT INTO warehouse VALUES (103, "Mary", "INDIA");
INSERT INTO warehouse VALUES (104, "Chloe", "AMERICA");
INSERT INTO warehouse VALUES (105, "Santa", "GREENLAND");
INSERT INTO warehouse VALUES (106, "Chris", "AFRICA");

SELECT * FROM warehouse;

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

CREATE TABLE Purchase_order_item(
order_id INT PRIMARY KEY,
product_id INT,
purchase_id INT,
ordered_item VARCHAR(50),
order_qnt INT,
FOREIGN KEY (purchase_id) REFERENCES Purchase_order(purchase_id),
FOREIGN KEY (product_id) REFERENCES Product(product_id)


);
SELECT * FROM Purchase_order_item;






