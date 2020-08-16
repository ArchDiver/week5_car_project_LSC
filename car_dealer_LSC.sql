-- TABLE creataion
CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name  VARCHAR(100),
    last_name   VARCHAR(100),
    email       VARCHAR(100),
    address     VARCHAR(200),
    phone       VARCHAR(15)
);

CREATE TABLE salesperson(
    staff_id    SERIAL PRIMARY KEY,
    first_name  VARCHAR(100),
    last_name   VARCHAR(100),
    contact_num VARCHAR(150),
    email       VARCHAR(100),    
);

CREATE TABLE car(
    serial_id   INTEGER PRIMARY KEY,
    make        VARCHAR (30),
    model       VARCHAR(30),
    staff_id    INTEGER,
    customer_id INTEGER,
    FOREIGN KEY (staff_id) REFERENCES salespersson(staff_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE sale(
    sale_id         SERIAL PRIMARY KEY,
    amount          NUMERIC(9,2),
    purchase_date   DATETIME,
    serial_id       INTEGER,
    staff_id        INTEGER,
    customer_id     INTEGER,
    FOREIGN KEY (serial_id) REFERENCES car(serial_id),
    FOREIGN KEY (staff_id) REFERENCES salespersson(staff_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE services(
    service_id SERIAL PRIMARY KEY,
    service_date DATETIME,
    part_cost NUMERIC(8,2),
    labor_cost NUMERIC(8,2),
    total_cost NUMERIC(10,2),
    desciption VARCHAR(500),
    serial_id INTEGER,
    customer_id INTEGER,
    parts_id INTEGER,
    FOREIGN KEY (serial_id) REFERENCES car(serial_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (part_id) REFERENCES parts(part_id)
);
service_id, service_date, parts_cost, labor_cost, total_cost, desciption, serial_id, customer_id 

CREATE TABLE mechanic(
    mechanic_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email       VARCHAR(100),
    address     VARCHAR(200),
    phone       VARCHAR(15)
);

CREATE TABLE mechanic_record(
    record_id SERIAL PRIMARY KEY,
    sevice_id INTEGER,
    mechanic_id INTEGER,
    FOREIGN KEY (service_id) REFERENCES services(service_id),
    FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id)
);

CREATE TABLE parts(
    part_id SERIAL PRIMARY KEY,
    part_type VARCHAR(100),
    part_price NUMERIC (6,2)
);


--------------------------------------------------------------------------------
-- DATA input

-- Car input -- 
INSERT INTO car(serial_id, make, model, model_year, price, seller_id, customer_id)
VALUES(1,'Toyota','Rav4 XSE',2019, 35000.00, 2, 1);

INSERT INTO car(serial_id, make, model, model_year, price, seller_id, customer_id)
VALUES(2,'Toyota','Prius V',2015, 13000.00, 1, 4);

INSERT INTO car(serial_id, make, model, model_year, price, seller_id, customer_id)
VALUES(3,'Honda','Fit',2013, 25000.00, 1, 3);

INSERT INTO car(serial_id, make, model, model_year, price, seller_id, customer_id)
VALUES(4,'Honda','Accord',2005, 30000, NULL, 2);

INSERT INTO car(serial_id, make, model, model_year, price, seller_id, customer_id)
VALUES(5,'Toyota','Prius Prime',2021, NULL, NULL, NULL);

---------------------------------------------------------------------
-- Inputting Customers --
INSERT INTO customer(customer_id, first_name, last_name, email, contact_num, address)
VALUES(1,'Westley','Roberts','thedread@theprincessbride.com','373-237-4728','1 Revenge Way, The Ship, The Ocean');

INSERT INTO customer(customer_id, first_name, last_name, email, contact_num, address)
VALUES(2,'Buttercup','Princess','buttercup@theprincessbride.com','843-774-6237','2 Caslte Way, West Farthing, Florin');

INSERT INTO customer(customer_id, first_name, last_name, email, contact_num, address)
VALUES(3,'Fezzik','Giant','thegaint@theprincessbride.com','	339-945-4426','3 Giant Rd, Lackland, Greenland');

INSERT INTO customer(customer_id, first_name, last_name, email, contact_num, address)
VALUES(4,'Inigo','Montoya','thesword@theprincessbride.com','464-466-6686','4 Montoya, Barcelona, Spain');

INSERT INTO customer(customer_id, first_name, last_name, email, contact_num, address)
VALUES(5,'Max','Miracle','micaclemax@theprincessbride.com','647-225-3629','5 Mirkwood Way, Mirkwood');

--Inputting Salespersons --
INSERT INTO salesperson(seller_id, first_name, last_name, email, contact_num, address)
VALUES(1,'Prince','Humperdinck','humperdinck@florin.gov','444-876-5432','King Suite, The Castle, Florin');

INSERT INTO salesperson(seller_id, first_name, last_name, email, contact_num, address)
VALUES(2,'Tyrone','Rugan','rugan@florin.gov','111-123-3579','Advisors Room, The Castle, Florin');

INSERT INTO salesperson(seller_id, first_name, last_name, email, contact_num, address)
VALUES(3,'The','Albino','albino@florin.gov','511-223-4964','The Pit, the forest, Florin');


-----------------------------------------------------------------------------------
-- Inputting Sales Invoices --
INSERT INTO sales_invoice(invoice_id, amount, purchase_date, serial_id, customer_id, seller_id)
VALUES(1, 35000, 05/26/2019, 1, 1, 3);

INSERT INTO sales_invoice(invoice_id, amount, purchase_date, serial_id, customer_id, seller_id)
VALUES(2, 30000, 2/25/2007, 4, 5, 1);

INSERT INTO sales_invoice(invoice_id, amount, purchase_date, serial_id, customer_id, seller_id)
VALUES(3, 13000, 6/23/2018, 4, 5, 1);

------------------------------------------------------------------------------------------------
-- Inputting Service Invoices --
INSERT INTO service_invoice(service_id, service_date, parts_cost, labor_cost, total_cost, desciption, serial_id, customer_id )
VALUES(1, 'Twinkle stars.', '02/02/2017', 3500.00, 4500.00, 8000, 4, 2);

INSERT INTO service_invoice(service_id, service_date, parts_cost, labor_cost, total_cost, desciption, serial_id, customer_id )
VALUES(2, 'Boop bop.', '08/28/2017', 2000.00, 3500.00, 5500, 1, 1);

INSERT INTO service_invoice(service_id, service_date, parts_cost, labor_cost, total_cost, desciption, serial_id, customer_id )
VALUES(3, 'Wheels fell off.', '05/22/2018', 500.00, 500.00, 1000, 3, 3);


--------------------------------------------------------------------------------------------------
-- Inputting Mechanics --
INSERT INTO mechanic(mechanic_id, first_name, last_name, email, contact_num, address)
VALUES(1,'Yellin','Brute','yellin@gilder.com','444-851-7893','The Golden Hall, Edoras, Rohan');

INSERT INTO mechanic(mechanic_id, first_name, last_name, email, contact_num, address)
VALUES(2,'Vizzini','Sicilian','inconceivable@gilder.com','535-121-5912','The Glittering Caves, Helms Deep, Rohan');

INSERT INTO mechanic(mechanic_id, first_name, last_name, email, contact_num, address)
VALUES(3,'old','clergyman','clergyman@gilder.com','744-145-2044','Near the Old Forest, The Valley of Withywindle');

INSERT INTO mechanic(mechanic_id, first_name, last_name, email, contact_num, address)
VALUES(4,'Skimp','Morgenstern', 'Morgenstern@gilder.com','111-123-3578','The Palace, Minas Tirith, Gondor');

---------------------------------------------------------------------------------------------------
-- Inputting Mechanic Record --
INSERT INTO mechanic_record(mech_rec_id, mechanic_id, service_id, labor_cost)
VALUES(1,1,2);

INSERT INTO mechanic_record(mech_rec_id, mechanic_id, service_id, labor_cost)
VALUES(2,1,1);

INSERT INTO mechanic_record(mech_rec_id, mechanic_id, service_id, labor_cost)
VALUES(3,2,2);

INSERT INTO mechanic_record(mech_rec_id, mechanic_id, service_id, labor_cost)
VALUES(4,4,2);

INSERT INTO mechanic_record(mech_rec_id, mechanic_id, service_id, labor_cost)
VALUES(5,3,3);

----------------------------------------------------------------------------------------------
-- Inputting Parts --
INSERT INTO parts(part_id, part_type, part_cost, service_id)
VALUES(1, 'ball joint', 500.00, 1);

INSERT INTO parts(part_id, part_type, part_cost, service_id)
VALUES(2, 'Toyota Camry engine parts', 1000.00, 2);

INSERT INTO parts(part_id, part_type, part_cost, service_id)
VALUES(3, 'Toyota Camry transmission parts', 500.00, 2);

SELECT *
FROM car;