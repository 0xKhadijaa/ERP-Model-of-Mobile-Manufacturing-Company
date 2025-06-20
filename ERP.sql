CREATE DATABASE ERPmobile;
 
 Use ERPmobile;

 --TABLE CREATION

 DROP TABLE if exists items;
 CREATE TABLE items(
 item_id int primary key not null,
 name varchar(50),
 quantity int,
 cost float,
 type varchar(50)
 );

 DROP TABLE if exists product;
 CREATE TABLE product(
 product_id int not null,
 dimension varchar(25),
 description varchar(200),
 primary key(product_id),
 );

 DROP TABLE if exists product_item;
 create table product_item(
 product_id int not null,
 item_id int not null,
 foreign key (item_id) references items(item_id) on delete cascade on update cascade,
 foreign key (product_id) references product(product_id) on delete cascade on update cascade
 );

 DROP TABLE if exists manufacturing;
 CREATE TABLE manufacturing(
 manufacturing_id int primary key not null,
 item_id int not null,
 manufacturing_date date,
 foreign key (item_id) references items(item_id) on delete cascade on update cascade
 );

 DROP TABLE if exists shipper;
 CREATE TABLE shipper(
 shipper_id int primary key not null,
 name varchar(50),
 phoneno varchar(50),
 address varchar(100)
 );

 DROP TABLE if exists inventory;
 CREATE TABLE inventory(
 inventory_id int primary key not null,
 item_id int not null,
 shipper_id int not null,
 ship_date date,
 location varchar(50),
 foreign key (item_id) references items(item_id) on delete cascade on update cascade,
 foreign key (shipper_id) references shipper(shipper_id) on delete cascade on update cascade
 );

 DROP TABLE if exists customer;
 CREATE TABLE customer(
 customer_id int primary key not null,
 customer_name varchar(50),
 address varchar(50),
 phoneno varchar(50)
 );

 DROP TABLE if exists orders;
 CREATE TABLE orders(
 order_id int primary key not null,
 product_id int not null,
 customer_id int not null,
 order_date date,
 foreign key (customer_id) references customer(customer_id) on delete cascade on update cascade,
 foreign key (product_id) references product(product_id) on delete cascade on update cascade
 );


INSERT INTO items (item_id, name, quantity, cost, type)
VALUES (1, 'Display Panel', 200, 35.99, 'Mobile Component'),
       (2, 'Battery', 150, 12.50, 'Mobile Component'),
       (3, 'Processor', 100, 79.99, 'Mobile Component'),
       (4, 'Camera Module', 80, 24.99, 'Mobile Component'),
       (5, 'Case', 300, 5.99, 'Mobile Component'),
	   (6, 'RAM Module', 200, 50.00, 'Mobile Component'),
       (7, 'Charging Cable', 500, 2.49, 'Mobile Accessory'),
	   (8, 'Sensors', 200, 15.00, 'Component'),
       (9, 'Screen Protector', 250, 1.50, 'Mobile Accessory'),
       (10, 'Sim Card Tray Ejector Tool', 1000, 0.25, 'Mobile Accessory');

	   -- UPDATE IN ITEMS TABLE ACCORDING TO OUR REQUIREMENTS

	   UPDATE items SET type = 
           CASE 
             WHEN item_id IN (1, 2, 3, 4, 5, 6, 7, 8) THEN 'Manufacturing'
           ELSE 'Inventory'
          END
             WHERE item_id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
Insert into items (item_id, name, quantity, cost, type)
VALUES(11, 'Khadija', 1, 0, 'Women')

INSERT INTO product (product_id, dimension, description)
VALUES	(1, '10x20', 'Great 16*9 display with 50mh battery. Latest processor is embedded in it, camera is 50Mp and latest sensors.'),
		(2, '15x25', 'Great 9 inch display with 70mh battery. Latest processor is embedded in it, camera is 120Mp, latest sensors, fast charging cable and other tools.'),
		(3, '12x18', 'Great 8.8 inch display with 20mh battery. Latest processor is embedded in it, camera is 50Mp , fast charging cable and tools.'),
		(4, '8x30', 'Great 6 inch display with 60mh battery. Latest processor is embedded in it, camera is 40Mp, gorilla screen protector and fast charging cable.'),
		(5, '20x20', 'Great 10 inch display with 50mh battery. Latest processor is embedded in it, camera is 30Mp, latest sensors, gorilla screen protector, fast charging cable and other tools.');

 insert into product_item (product_id, item_id) 
 values (1,1), (1,2), (1,3), (1,4), (1,5), (1,6), (1,8),                          --PRODUCT 1
        (2,1), (2,2), (2,3), (2,4), (2,5), (2,6), (2,8), (2,10), (2,7),           --PRODUCT 2
        (3,9), (3,1), (3,2), (3,3), (3,4), (3,5), (3,6), (3,7), (3,10),           --PRODUCT 3
		(4,1), (4,2), (4,3), (4,4), (4,5), (4,6), (4,7), (4,9),		              --PRODUCT 4
        (5,1), (5,2), (5,3), (5,4), (5,5), (5,6), (5,7), (5,8), (5,9), (5,10);    --PRODUCT 5

 INSERT INTO manufacturing (manufacturing_id, item_id, manufacturing_date)
VALUES (11, 3, '2024-05-02'),
       (12, 2, '2024-04-25'),
       (13, 3, '2024-06-20'),
       (14, 4 , '2024-02-18'),
       (15, 5 , '2024-05-15'),
       (16, 6 , '2024-04-30'),
       (17, 7 , '2024-08-20'),
       (18, 8 , '2024-10-15'),  
       (20, 4 , '2024-12-05');

 insert into shipper (shipper_id, name, phoneno, address) 
 values (1, 'UPS', '1-800-742-5877', '55 Glenlake Pkwy NE, Atlanta'),
		(2, 'FedEx', '1-800-463-3339', '942 S Shady Grove Rd, Memphis, Morocoo'),
		(3, 'Amazon Logistics', '1-888-280-4331', '440 Terry Ave N, London'),
		(4, 'UPS Freight', '1-800-333-7400', '1000 Semmes Ave, Richmond, US'),
		(5, 'Purolator', '1-888-744-7123', '5995 Avebury Rd, Mississauga, Canada'),
		(6, 'Royal Mail', '03457 740 740', '148 Old St, London EC1V 9HQ, UK');

 insert into inventory (inventory_id, item_id, shipper_id, ship_date, location) 
 values (1, 3, 1, '2024-04-30', 'Atlanta'),
		(2, 5, 1, '2024-05-01', 'Atlanta'),
		(3, 1, 3, '2024-05-02', 'London'),
		(4, 2, 2, '2024-05-03', 'Morocoo'),
		(5, 4, 5, '2024-05-04', 'Canada'),
		(6, 7, 6, '2024-05-05', 'UK'),
		(7, 6, 4, '2024-05-06', 'US'),
		(8, 8, 2, '2024-05-07', 'Morocoo'),
		(9, 9, 5, '2024-05-08', 'Canada'),
		(10, 10, 4, '2024-05-09', 'US');  
 
 INSERT INTO customer (customer_id,customer_name, address, phoneno)
VALUES (101, 'John Smith', '123 Any St, Anytown, CA 12345', '+1 (555) 555-9876'),
       (102, 'Jane Doe', '456 Elm St, Anytown, CA 98765', '+1 (555) 555-2468'),
       (103, 'Alice Walker', '789 Main St, Anytown, CA 54321', '+1 (555) 555-7890'),
       (104, 'Bob Jones', '1011 Elm St, Anytown, CA 54321', '+1 (555) 555-1357'),
       (105, 'Sarah Lee', '1234 Maple St, Anytown, CA 98765', '+1 (555) 555-3210'),
       (106, 'David Miller', '5678 Oak St, Anytown, CA 12345', '+1 (555) 555-0987'),
       (107, 'Emily Brown', '9012 Pine St, Anytown, CA 54321', '+1 (555) 555-6543'),
       (108, 'Charles Johnson', '1314 Spruce St, Anytown, CA 98765', '+1 (555) 555-4810'),
       (109, 'Olivia Garcia', '1516 Poplar St, Anytown, CA 12345', '+1 (555) 555-2137'),
       (110, 'William Hernandez', '1718 Elm St, Anytown, CA 54321', '+1 (555) 555-7460'),
       (111, 'Jennifer Lopez', '1920 Maple St, Anytown, CA 98765', '+1 (555) 555-8793'),
       (112, 'Michael Davis', '2122 Oak St, Anytown, CA 12345', '+1 (555) 555-5120'),
       (113, 'Ashley Wilson', '2324 Pine St, Anytown, CA 54321', '+1 (555) 555-0457'),
       (114, 'Kevin Thomas', '2526 Spruce St, Anytown, CA 98765', '+1 (555) 555-3780'),
       (115, 'Nicole Garcia', '2728 Poplar St, Anytown, CA 12345', '+1 (555) 555-9013');

 INSERT INTO orders (order_id, product_id, customer_id, order_date)
VALUES (1, 1, 101, '2024-05-01'),
       (2, 2, 102, '2023-01-02'),
       (3, 1, 103, '2023-02-03'),
       (4, 4, 104, '2024-04-04'),
       (5, 3, 105, '2022-07-05'),
       (6, 3, 106, '2024-05-06'),
       (7, 4, 111, '2021-05-07'),
       (8, 5, 113, '2020-09-08'),
       (9, 2, 109, '2024-12-09'),
       (10,1, 115, '2024-06-10');

	   Select * from items;
	   Select * from customer;
	   Select * from inventory;
	   Select * from manufacturing;
	   Select * from orders;
	   Select * from product;
	   Select * from product_item;
	   Select * from shipper;


-- TRIGGERS
--(coz product is made up of items and both have different tables)
CREATE TRIGGER product_item_insert_check
ON product_item
INSTEAD OF INSERT
AS
 BEGIN
    SET NOCOUNT ON;

    -- Check if product ID exists in product table
    IF NOT EXISTS (SELECT 1 
                   FROM inserted i JOIN product p ON i.product_id = p.product_id)
    BEGIN
        RAISERROR('Product ID does not exist in product table.', 16, 1);
        RETURN;
    END;

    -- Check if item ID exists in item table
    IF NOT EXISTS (SELECT 1 
                   FROM inserted i JOIN items itm ON i.item_id = itm.item_id)
    BEGIN
        RAISERROR('Item ID does not exist in item table.', 16, 1);
        RETURN;
    END;

    -- Both product and item IDs exist, allow insertion into product_item
    INSERT INTO product_item (product_id, item_id)
    SELECT product_id, item_id
    FROM inserted;
END;

CREATE TRIGGER inventory_insert_check
ON inventory
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if Shipper ID exists in product table
    IF NOT EXISTS (SELECT 1 
                   FROM inserted i JOIN shipper s ON i.shipper_id = s.shipper_id)
    BEGIN
        RAISERROR('Shipper ID does not exist in product table.', 16, 1);
        RETURN;
    END;

    -- Check if item ID exists in item table
    IF NOT EXISTS (SELECT 1 
                   FROM inserted i JOIN items itm ON i.item_id = itm.item_id)
    BEGIN
        RAISERROR('Item ID does not exist in item table.', 16, 1);
        RETURN;
    END;

    -- Both shipper and item IDs exist, allow insertion into inventory
    INSERT INTO inventory (inventory_id,item_id,shipper_id,ship_date,location)
    SELECT inventory_id,item_id,shipper_id,ship_date,location
    FROM inserted;
END;

CREATE TRIGGER order_insert_check
ON orders
INSTEAD OF INSERT 
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if product ID exists in product table
    IF NOT EXISTS (SELECT 1 
                   FROM inserted i JOIN product p ON i.product_id = p.product_id)
    BEGIN
        RAISERROR('Product ID does not exist in product table.', 16, 1);
        RETURN;
    END;

    -- Check if Customer ID exists in item table
    IF NOT EXISTS (SELECT 1 
                   FROM inserted i JOIN customer c ON i.customer_id = c.customer_id)
    BEGIN
        RAISERROR('Item ID does not exist in item table.', 16, 1);
        RETURN;
    END;

    -- Both product and customer IDs exist, allow insertion into orders
    INSERT INTO orders (order_id,product_id,customer_id,order_date)
    SELECT order_id,product_id,customer_id,order_date
    FROM inserted;
END;

CREATE TRIGGER manufacturing_insert_check
ON manufacturing
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    
    -- Check if item ID exists in item table
    IF NOT EXISTS (SELECT 1 
                   FROM inserted i JOIN items itm ON i.item_id = itm.item_id)
    BEGIN
        RAISERROR('Item ID does not exist in item table.', 16, 1);
        RETURN;
    END;

    -- item IDs exist, allow insertion into manufacturing
    INSERT INTO manufacturing (manufacturing_id, item_id,manufacturing_date)
    SELECT manufacturing_id, item_id,manufacturing_date
    FROM inserted;
END;

--HISTORY MAINTAINANCE

Create table items_history(
change_id int identity primary key,
item_id int,
name varchar(50),
quantity int,
cost float,
type varchar(50),
updated_at Datetime not null,
operation varchar(3) not null,
check(operation='INS' or operation='DEL' or operation='UPD')
);

create table product_history(
change_id int identity primary key,
product_id int,
dimension varchar(25),
description varchar(100),
updated_at Datetime not null,
operation varchar(3) not null,
check(operation='INS' or operation='DEL' or operation='UPD')
 );

 create table product_item_history(
 change_id int identity primary key,
 product_id int,
 item_id int,
 updated_at Datetime not null,
operation varchar(3) not null,
check(operation='INS' or operation='DEL' or operation='UPD')
 );

 create table manufacturing_history(

 change_id int identity primary key,
  manufacturing_id int,
 item_id int,
 manufacturing_date date,
 updated_at Datetime not null,
operation varchar(3) not null,
check(operation='INS' or operation='DEL' or operation='UPD')
 );

 create table inventory_history(

 change_id int identity primary key,
inventory_id int,
 item_id int,
 shipper_id int,
 ship_date date,
 location varchar(30),
 updated_at Datetime not null,
operation varchar(3) not null,
check(operation='INS' or operation='DEL' or operation='UPD')
 );

 create table order_history(

change_id int identity primary key,
order_id int,
product_id int,
customer_id int,
order_date date,
updated_at Datetime not null,
operation varchar(3) not null,
check(operation='INS' or operation='DEL' or operation='UPD')
 );

create table shipper_history(

change_id int identity primary key,
shipper_id int,
name varchar(50),
phoneno varchar(50),
address varchar(100),
updated_at Datetime not null,
operation varchar(3) not null,
check(operation='INS' or operation='DEL' or operation='UPD')
);

create table customer_history(

change_id int identity primary key,
customer_id int,
 customer_name varchar(50),
 address varchar(100),
 phoneno varchar(50),
updated_at Datetime not null,
operation varchar(3) not null,
check(operation='INS' or operation='DEL' or operation='UPD')
);

SELECT * FROM items_history
SELECT * FROM product_history
SELECT * FROM product_item_history
SELECT * FROM manufacturing_history
SELECT * FROM inventory_history
SELECT * FROM order_history
SELECT * FROM shipper_history
SELECT * FROM customer_history 

-- HISTORY TRIGGERS

CREATE TRIGGER product_item_audit_trigger
ON product_item
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert for INSERT operation
    INSERT INTO product_item_history
    (
        product_id,
        item_id,
        updated_at,
        operation
    )
    SELECT
        i.product_id,
        i.item_id,
        GETDATE(),
        'INS'
    FROM
        inserted AS i
    UNION ALL
    SELECT
        d.product_id,
        d.item_id,
        GETDATE(),
        'DEL'
    FROM
        deleted AS d;

    -- Insert for UPDATE operation (if either product_id or item_id is modified)
    IF UPDATE(product_id) OR UPDATE(item_id)
    BEGIN
        INSERT INTO product_item_history
        (
            product_id,
            item_id,
            updated_at,
            operation
        )
        SELECT
            i.product_id,
            i.item_id,
            GETDATE(),
            'UPD'
        FROM
            inserted AS i
        INNER JOIN
            deleted AS d ON i.product_id = d.product_id AND i.item_id = d.item_id
        WHERE
            (i.product_id <> d.product_id OR i.item_id <> d.item_id);
    END;
END;


CREATE TRIGGER product_audit_trigger
ON product
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert for INSERT operation
    INSERT INTO product_history
    (
        product_id,
        dimension,
		description,
        updated_at,
        operation
    )
    SELECT
        i.product_id,
        i.dimension,
		i.description,
        GETDATE(),
        'INS'
    FROM
        inserted AS i
    UNION ALL
    SELECT
        d.product_id,
        d.dimension,
		d.description,
        GETDATE(),
        'DEL'
    FROM
        deleted AS d;

   
    IF UPDATE(product_id) OR UPDATE(dimension) OR UPDATE(description)
    BEGIN
        INSERT INTO product_history
        (
            product_id,
            dimension,
		    description,
            updated_at,
            operation
        )
        SELECT
            i.product_id,
            i.dimension,
			i.description,
            GETDATE(),
            'UPD'
        FROM
            inserted AS i
        INNER JOIN
            deleted AS d ON i.product_id = d.product_id AND i.dimension= d.dimension AND i.description=d.description
        WHERE
            (i.product_id <> d.product_id OR i.dimension <> d.dimension OR i.description<>d.description);
    END;
END;

CREATE TRIGGER item_audit_trigger
ON items
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- INSERT and DELETE
    INSERT INTO items_history
    (
        item_id,
        name,
        quantity,
        cost,
        type,
        updated_at,
        operation
    )
    SELECT
        i.item_id,
        i.name,
        i.quantity,
        i.cost,
        i.type,
        GETDATE(),
        'INS'
    FROM inserted i
    UNION ALL
    SELECT
        d.item_id,
        d.name,
        d.quantity,
        d.cost,
        d.type,
        GETDATE(),
        'DEL'
    FROM deleted d;

	--UPDATE
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN deleted d
        ON i.item_id = d.item_id
        WHERE 
            i.name <> d.name
            OR i.quantity <> d.quantity
            OR i.cost <> d.cost
            OR i.type <> d.type
    )
    BEGIN
        INSERT INTO items_history
        (
            item_id,
            name,
            quantity,
            cost,
            type,
            updated_at,
            operation
        )
        SELECT
            i.item_id,
            i.name,
            i.quantity,
            i.cost,
            i.type,
            GETDATE(),
            'UPD'
        FROM inserted i;
    END;
END;

ALTER TRIGGER manufacturing_audit_trigger
ON manufacturing
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert for INSERT operation
    INSERT INTO manufacturing_history
    (
	    manufacturing_id,
        item_id,
        manufacturing_date,
        updated_at,
        operation
    )
    SELECT
        i.manufacturing_id,
        i.item_id,
		i.manufacturing_date,
        GETDATE(),
        'INS'
    FROM
        inserted AS i
    UNION ALL
    SELECT
	    d.manufacturing_id,
        d.item_id,
        d.manufacturing_date,
        GETDATE(),
        'DEL'
    FROM
        deleted AS d;

    -- Insert for UPDATE operation 
    IF UPDATE(item_id) OR UPDATE(manufacturing_id) OR UPDATE(manufacturing_date)
    BEGIN
        INSERT INTO manufacturing_history
        (
		    manufacturing_id,
            item_id,
            manufacturing_date,
            updated_at,
            operation
        )
        SELECT
		    i.manufacturing_id,
            i.item_id,
            i.manufacturing_date,
            GETDATE(),
            'UPD'
        FROM
            inserted AS i
        INNER JOIN
            deleted AS d ON i.item_id = d.item_id AND i.manufacturing_id= d.manufacturing_id AND i.manufacturing_date=d.manufacturing_date
        WHERE
            (i.manufacturing_id<>d.manufacturing_id or d.item_id <> d.item_id OR i.manufacturing_date <> d.manufacturing_date);
    END;
END;


CREATE TRIGGER inventory_audit_trigger
ON inventory
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert for INSERT operation
    INSERT INTO inventory_history
    (
	    inventory_id,
        item_id,
		shipper_id,
        ship_date,
		location,
        updated_at,
        operation
    )
    SELECT
        i.inventory_id,
        i.item_id,
		i.shipper_id,
		i.ship_date,
		i.location,
        GETDATE(),
        'INS'
    FROM
        inserted AS i
    UNION ALL
    SELECT
	    d.inventory_id,
        d.item_id,
        d.shipper_id,
		d.ship_date,
		d.location,
        GETDATE(),
        'DEL'
    FROM
        deleted AS d;

    -- Insert for UPDATE operation 
    IF UPDATE(item_id) OR UPDATE(inventory_id) OR UPDATE(ship_date) or UPDATE(shipper_id) or UPDATE(location)
    BEGIN
        INSERT INTO inventory_history
        (
		    inventory_id,
            item_id,
			shipper_id,
			ship_date,
            location,
            updated_at,
            operation
        )
        SELECT
		    i.inventory_id,
            i.item_id,
			i.shipper_id,
			i.ship_date,
            i.location,
            GETDATE(),
            'UPD'
        FROM
            inserted AS i
        INNER JOIN
            deleted AS d ON i.item_id = d.item_id AND i.inventory_id= d.inventory_id AND i.ship_date=d.ship_date AND i.shipper_id=d.shipper_id AND i.location=d.location
        WHERE
            (i.inventory_id<>d.inventory_id or d.item_id <> d.item_id OR i.ship_date <> d.ship_date or i.shipper_id<>d.shipper_id or i.location<>d.location);
    END;
END;


CREATE TRIGGER order_audit_trigger
ON orders
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert for INSERT operation
    INSERT INTO order_history
    (
	    order_id,
        product_id,
		customer_id,
		order_date,
        updated_at,
        operation
    )
    SELECT
        i.order_id,
        i.product_id,
		i.customer_id,
		i.order_date,
		
        GETDATE(),
        'INS'
    FROM
        inserted AS i
    UNION ALL
    SELECT
	    d.order_id,
        d.product_id,
		d.customer_id,
		d.order_date,
        GETDATE(),
        'DEL'
    FROM
        deleted AS d;

    -- Insert for UPDATE operation 
    IF UPDATE(order_id) OR UPDATE(product_id) OR UPDATE(customer_id) or UPDATE(order_date)
    BEGIN
        INSERT INTO order_history
        (
		    order_id,
            product_id,
		    customer_id,
		    order_date,
            updated_at,
            operation
        )
        SELECT
		    i.order_id,
            i.product_id,
		    i.customer_id,
		    i.order_date,
            GETDATE(),
            'UPD'
        FROM
            inserted AS i
        INNER JOIN
            deleted AS d ON i.order_id = d.order_id AND i.product_id= d.product_id AND i.customer_id=d.customer_id AND i.order_date=d.order_date 
        WHERE
            (i.order_id<>d.order_id or d.product_id <> d.product_id OR i.customer_id <> d.customer_id or i.order_date<>d.order_date);
    END;
END;


CREATE TRIGGER shipper_audit_trigger
ON shipper
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert for INSERT operation
    INSERT INTO shipper_history
    (
	    shipper_id,
        name,
		phoneno,
		address,
        updated_at,
        operation
    )
    SELECT
        i.shipper_id,
        i.name,
		i.phoneno,
		i.address,
		
        GETDATE(),
        'INS'
    FROM
        inserted AS i
    UNION ALL
    SELECT
	    d.shipper_id,
        d.name,
		d.phoneno,
		d.address,
        GETDATE(),
        'DEL'
    FROM
        deleted AS d;

    -- Insert for UPDATE operation 
    IF UPDATE(shipper_id) OR UPDATE(name) OR UPDATE(phoneno) or UPDATE(address)
    BEGIN
        INSERT INTO shipper_history
        (
		    shipper_id,
            name,
		    phoneno,
		    address,
            updated_at,
            operation
        )
        SELECT
		    i.shipper_id,
            i.name,
		    i.phoneno,
		    i.address,
            GETDATE(),
            'UPD'
        FROM
            inserted AS i
        INNER JOIN
            deleted AS d ON i.shipper_id = d.shipper_id AND i.name= d.name AND i.phoneno=d.phoneno AND i.address=d.address 
        WHERE
            (i.name<>d.name or d.shipper_id <> d.shipper_id OR i.phoneno <> d.phoneno or i.address<>d.address);
    END;
END;


CREATE TRIGGER customer_audit_trigger
ON customer
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert for INSERT operation
    INSERT INTO customer_history
    (
	    customer_id,
        customer_name,
		phoneno,
		address,
        updated_at,
        operation
    )
    SELECT
        i.customer_id,
        i.customer_name,
		i.phoneno,
		i.address,
		
        GETDATE(),
        'INS'
    FROM
        inserted AS i
    UNION ALL
    SELECT
	    d.customer_id,
        d.customer_name,
		d.phoneno,
		d.address,
        GETDATE(),
        'DEL'
    FROM
        deleted AS d;

    -- Insert for UPDATE operation 
    IF UPDATE(customer_id) OR UPDATE(customer_name) OR UPDATE(phoneno) or UPDATE(address)
    BEGIN
        INSERT INTO customer_history
        (
		    customer_id,
            customer_name,
		    phoneno,
		    address,
            updated_at,
            operation
        )
        SELECT
		    i.customer_id,
            i.customer_name,
		    i.phoneno,
		    i.address,
            GETDATE(),
            'UPD'
        FROM
            inserted AS i
        INNER JOIN
            deleted AS d ON i.customer_id = d.customer_id AND i.customer_name= d.customer_name AND i.phoneno=d.phoneno AND i.address=d.address 
        WHERE
            (i.customer_name<>d.customer_name or d.customer_id <> d.customer_id OR i.phoneno <> d.phoneno or i.address<>d.address);
    END;
END;

-- VIEWS

--items with their associated products
CREATE VIEW vw_ItemProduct AS
SELECT 
    i.item_id, 
    i.name AS item_name, 
    i.quantity, 
    i.cost, 
    i.type, 
    p.product_id, 
    p.dimension, 
    p.description
FROM items i
JOIN product_item pi ON i.item_id = pi.item_id
JOIN product p ON pi.product_id = p.product_id;

-- manufacturing details with item information

CREATE VIEW vw_ManufacturingDetails AS
SELECT 
    m.manufacturing_id, 
    i.item_id, 
    i.name AS item_name, 
    m.manufacturing_date
FROM manufacturing m
JOIN items i ON m.item_id = i.item_id;

--inventory details with item and shipper information
CREATE VIEW vw_InventoryDetails AS
SELECT 
    inv.inventory_id, 
    i.item_id, 
    i.name AS item_name, 
    s.shipper_id, 
    s.name AS shipper_name, 
    inv.ship_date, 
    inv.location
FROM inventory inv
JOIN items i ON inv.item_id = i.item_id
JOIN shipper s ON inv.shipper_id = s.shipper_id;

--customer orders with product information
CREATE VIEW vw_CustomerOrders AS
SELECT 
    o.order_id, 
    c.customer_id, 
    c.customer_name, 
    c.address AS customer_address, 
    c.phoneno AS customer_phone, 
    p.product_id, 
    p.description AS product_description, 
    o.order_date
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
JOIN product p ON o.product_id = p.product_id;

--HISTORY VIEW

CREATE VIEW vw_AllHistory AS
SELECT 
    'Items' AS source_table,
    change_id,
    item_id AS record_id,
    name,
    quantity,
    cost,
    type,
    updated_at,
    operation
FROM items_history

UNION ALL

SELECT 
    'Product' AS source_table,
    change_id,
    product_id AS record_id,
    dimension AS name,
    NULL AS quantity,
    NULL AS cost,
    NULL AS type,
    updated_at,
    operation
FROM product_history

UNION ALL

SELECT 
    'Product_Item' AS source_table,
    change_id,
    product_id AS record_id,
    NULL AS name,
    NULL AS quantity,
    NULL AS cost,
    NULL AS type,
    updated_at,
    operation
FROM product_item_history

UNION ALL

SELECT 
    'Manufacturing' AS source_table,
    change_id,
    manufacturing_id AS record_id,
    NULL AS name,
    NULL AS quantity,
    NULL AS cost,
    NULL AS type,
    updated_at,
    operation
FROM manufacturing_history

UNION ALL

SELECT 
    'Inventory' AS source_table,
    change_id,
    inventory_id AS record_id,
    NULL AS name,
    NULL AS quantity,
    NULL AS cost,
    NULL AS type,
    updated_at,
    operation
FROM inventory_history

UNION ALL

SELECT 
    'Orders' AS source_table,
    change_id,
    order_id AS record_id,
    NULL AS name,
    NULL AS quantity,
    NULL AS cost,
    NULL AS type,
    updated_at,
    operation
FROM order_history

UNION ALL

SELECT 
    'Shipper' AS source_table,
    change_id,
    shipper_id AS record_id,
    name,
    NULL AS quantity,
    NULL AS cost,
    NULL AS type,
    updated_at,
    operation
FROM shipper_history

UNION ALL

SELECT 
    'Customer' AS source_table,
    change_id,
    customer_id AS record_id,
    customer_name AS name,
    NULL AS quantity,
    NULL AS cost,
    NULL AS type,
    updated_at,
    operation
FROM customer_history;


SELECT * FROM vw_AllHistory