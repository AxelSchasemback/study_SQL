CREATE DATABASE TRANSPORTE;

use TRANSPORTE;

CREATE TABLE venc_vehiculo (
    id_venc_vehiculo INT PRIMARY KEY,
    vtv DATE NOT NULL,
    seguro DATE NOT NULL,
    cedula DATE NOT NULL
);

CREATE TABLE vehiculo (
    id_truck INT,
    patent VARCHAR(12) UNIQUE,
    name_truck VARCHAR(30),
    tara INT,
    load_max INT,
    id_venc_vehiculo INT,
    PRIMARY KEY (id_truck, id_venc_vehiculo),
        CONSTRAINT FK_id_venc_vehiculo 
        FOREIGN KEY (id_venc_vehiculo) 
        REFERENCES venc_vehiculo (id_venc_vehiculo)
);

CREATE TABLE vencimiento_chofer (
    id_vencimiento_driver INT PRIMARY KEY,
    register DATE NOT NULL,
    gral_load DATE NOT NULL,
    danger_load DATE NOT NULL,
    psycho DATE NOT NULL
);

CREATE TABLE chofer (
    id_driver INT,
    dni INT UNIQUE NOT NULL,
    first_name VARCHAR(15),
    last_name VARCHAR(15),
    birth_date DATETIME,
    id_vencimiento_driver INT,
    PRIMARY KEY (id_driver, id_vencimiento_driver),
        CONSTRAINT FK_ID_VENCIMIENTO_CHOFER
        FOREIGN KEY (id_vencimiento_driver)
        REFERENCES vencimiento_chofer (id_vencimiento_driver)
);

CREATE TABLE empresa (
    id_company INT PRIMARY KEY,
    cuit_company VARCHAR(12) UNIQUE NOT NULL,
    name_company VARCHAR(40),
    date_company DATE
);


CREATE TABLE pago (
    id_pay INT,
    importe INT,
    buy_order INT NOT NULL ,
    num_order_pay INT NOT NULL,
    date_pay DATE NOT NULL,
    address VARCHAR(75) NOT NULL,
    id_company INT,
    PRIMARY KEY (id_pay, id_company),
        CONSTRAINT FK_ID_COMPANY
        FOREIGN KEY (id_company)
        REFERENCES empresa (id_company)
);

CREATE TABLE transporte (
    id_transport INT,
    id_driver INT,
    id_truck INT,
    id_pay INT,
    PRIMARY KEY (id_transport, id_driver, id_truck, id_pay),
        CONSTRAINT FK_ID_DRIVER
        FOREIGN KEY (id_driver)
        REFERENCES chofer (id_driver),
            CONSTRAINT FK_ID_TRUCK
            FOREIGN KEY (id_truck)
            REFERENCES vehiculo (id_truck),
                CONSTRAINT FK_ID_PAY
                FOREIGN KEY (id_pay)
                REFERENCES pago (id_pay)
);

CREATE TABLE producto (
    id_product INT,
    name_product VARCHAR(50) NOT NULL,
    desc_product VARCHAR(225),
    dangerous BOOLEAN NOT NULL,
    kg FLOAT,
    cant INT NOT NULL,
    id_transport INT,
    PRIMARY KEY (id_product, id_transport),
        CONSTRAINT FK_ID_TRANSPORT
        FOREIGN KEY (id_transport)
        REFERENCES transporte (id_transport)
);

CREATE TABLE empresa_destino (
    id_company_d INT,
    name_company_d VARCHAR(50),
    cuit_company_d VARCHAR(12) UNIQUE NOT NULL,
    date_company_d DATE NOT NULL,
    address_company_d VARCHAR(120) NOT NULL,
    id_product INT,
    PRIMARY KEY (id_company_d, id_product),
        CONSTRAINT FK_ID_PRODUCT
        FOREIGN KEY (id_product)
        REFERENCES producto (id_product)
);
