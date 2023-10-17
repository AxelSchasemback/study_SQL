/* Creacion de la base de datos y Tablas*/

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


/* Inserccion de Datos*/
/* venc_vehiculo*/
insert into venc_vehiculo (id_venc_vehiculo, vtv, seguro, cedula) values (1, '2024-03-22', '2023-02-17', '2023-12-22');
insert into venc_vehiculo (id_venc_vehiculo, vtv, seguro, cedula) values (2, '2024-01-15', '2023-05-29', '2022-12-17');
insert into venc_vehiculo (id_venc_vehiculo, vtv, seguro, cedula) values (3, '2023-10-31', '2023-03-10', '2023-08-4');
insert into venc_vehiculo (id_venc_vehiculo, vtv, seguro, cedula) values (4, '2023-03-26', '2023-12-14', '2022-11-19');
insert into venc_vehiculo (id_venc_vehiculo, vtv, seguro, cedula) values (5, '2022-11-30', '2023-07-11', '2024-04-02');
insert into venc_vehiculo (id_venc_vehiculo, vtv, seguro, cedula) values (6, '2023-07-17', '2022-09-12', '2024-01-19');
insert into venc_vehiculo (id_venc_vehiculo, vtv, seguro, cedula) values (7, '2024-08-15', '2024-02-29', '2022-12-11');
insert into venc_vehiculo (id_venc_vehiculo, vtv, seguro, cedula) values (8, '2023-07-30', '2022-10-05', '2023-10-02');
insert into venc_vehiculo (id_venc_vehiculo, vtv, seguro, cedula) values (9, '2023-02-07', '2023-01-07', '2023-08-22');
insert into venc_vehiculo (id_venc_vehiculo, vtv, seguro, cedula) values (10, '2023-09-14', '2023-02-03', '2023-04-03');

/* vehiculo */
insert into vehiculo (id_truck, Patent, name_truck, tara, load_max, id_venc_vehiculo) values (1, 'DEF456', 'Mercedes', 9811, 21732, 1);
insert into vehiculo (id_truck, Patent, name_truck, tara, load_max, id_venc_vehiculo) values (2, 'ABC123', 'Ford', 6737, 23742, 2);
insert into vehiculo (id_truck, Patent, name_truck, tara, load_max, id_venc_vehiculo) values (3, 'XYZ789', 'Mercedes', 8951, 13311, 3);
insert into vehiculo (id_truck, Patent, name_truck, tara, load_max, id_venc_vehiculo) values (4, 'KSZ712', 'Mercedes', 8303, 15254, 4);
insert into vehiculo (id_truck, Patent, name_truck, tara, load_max, id_venc_vehiculo) values (5, 'OYZ755', 'Ford', 8379, 14568, 5);
insert into vehiculo (id_truck, Patent, name_truck, tara, load_max, id_venc_vehiculo) values (6, 'jYR724', 'Ford', 8621, 21346, 6);
insert into vehiculo (id_truck, Patent, name_truck, tara, load_max, id_venc_vehiculo) values (7, 'TYT778', 'Mercedes', 7765, 16827, 7);
insert into vehiculo (id_truck, Patent, name_truck, tara, load_max, id_venc_vehiculo) values (8, 'AJZ786', 'Ford', 9386, 14408, 8);
insert into vehiculo (id_truck, Patent, name_truck, tara, load_max, id_venc_vehiculo) values (9, 'GKZ767', 'Ford', 8503, 21906, 9);
insert into vehiculo (id_truck, Patent, name_truck, tara, load_max, id_venc_vehiculo) values (10, 'DAT486', 'Ford', 9832, 17193, 10);

/* vencimiento_chofer */
insert into vencimiento_chofer (id_vencimiento_driver, register, gral_load, danger_load, psycho) values (1, '2025-06-23', '2024-11-24', '2025-07-15', '2024-02-01');
insert into vencimiento_chofer (id_vencimiento_driver, register, gral_load, danger_load, psycho) values (2, '2025-05-16', '2024-05-31', '2025-07-03', '2025-08-15');
insert into vencimiento_chofer (id_vencimiento_driver, register, gral_load, danger_load, psycho) values (3, '2025-03-01', '2025-06-23', '2023-12-22', '2024-10-27');
insert into vencimiento_chofer (id_vencimiento_driver, register, gral_load, danger_load, psycho) values (4, '2025-04-10', '2024-06-04', '2025-04-10', '2025-07-06');
insert into vencimiento_chofer (id_vencimiento_driver, register, gral_load, danger_load, psycho) values (5, '2024-11-29', '2025-08-04', '2024-06-02', '2024-01-01');
insert into vencimiento_chofer (id_vencimiento_driver, register, gral_load, danger_load, psycho) values (6, '2024-08-23', '2025-02-05', '2025-01-13', '2024-06-03');
insert into vencimiento_chofer (id_vencimiento_driver, register, gral_load, danger_load, psycho) values (7, '2024-08-05', '2025-07-11', '2024-03-09', '2024-08-03');
insert into vencimiento_chofer (id_vencimiento_driver, register, gral_load, danger_load, psycho) values (8, '2024-10-13', '2025-01-28', '2024-11-04', '2024-10-16');
insert into vencimiento_chofer (id_vencimiento_driver, register, gral_load, danger_load, psycho) values (9, '2024-05-01', '2024-02-13', '2025-03-06', '2024-11-03');
insert into vencimiento_chofer (id_vencimiento_driver, register, gral_load, danger_load, psycho) values (10, '2024-07-06', '2024-06-10', '2024-08-31', '2024-10-08');

/* chofer */
insert into chofer (id_driver, dni, first_name, last_name, birth_date, id_vencimiento_driver) values (1, 28279698, 'Leisha', 'Hamley', '1993-03-29', 1);
insert into chofer (id_driver, dni, first_name, last_name, birth_date, id_vencimiento_driver) values (2, 29693965, 'Kizzie', 'Gamlin', '1976-02-22', 2);
insert into chofer (id_driver, dni, first_name, last_name, birth_date, id_vencimiento_driver) values (3, 41678189, 'George', 'Piper', '1979-08-15', 3);
insert into chofer (id_driver, dni, first_name, last_name, birth_date, id_vencimiento_driver) values (4, 21334759, 'Kellby', 'Batsford', '1987-06-07', 4);
insert into chofer (id_driver, dni, first_name, last_name, birth_date, id_vencimiento_driver) values (5, 44565835, 'Gretta', 'Libero', '1999-01-30', 5);
insert into chofer (id_driver, dni, first_name, last_name, birth_date, id_vencimiento_driver) values (6, 31902387, 'Nicki', 'Croasdale', '1983-04-28', 6);
insert into chofer (id_driver, dni, first_name, last_name, birth_date, id_vencimiento_driver) values (7, 21917471, 'Darin', 'Boutellier', '1994-01-26', 7);
insert into chofer (id_driver, dni, first_name, last_name, birth_date, id_vencimiento_driver) values (8, 39358822, 'Latrina', 'Philipsen', '1983-09-12', 8);
insert into chofer (id_driver, dni, first_name, last_name, birth_date, id_vencimiento_driver) values (9, 39669600, 'Adolpho', 'Mahedy', '1995-05-29', 9);
insert into chofer (id_driver, dni, first_name, last_name, birth_date, id_vencimiento_driver) values (10, 20952373, 'Kipp', 'Bollum', '1976-12-31', 10);

/* empresa */
insert into empresa (id_company, cuit_company, name_company, date_company) values (1, 9328169410, 'Price-Stehr', '2018-08-19');
insert into empresa (id_company, cuit_company, name_company, date_company) values (2, 1485969972, 'Hyatt, Raynor and Hoeger', '2018-04-06');
insert into empresa (id_company, cuit_company, name_company, date_company) values (3, 6894168148, 'Durgan, Hills and Hettinger', '2017-09-30');
insert into empresa (id_company, cuit_company, name_company, date_company) values (4, 1846707188, 'Goldner-Maggio', '2020-12-22');
insert into empresa (id_company, cuit_company, name_company, date_company) values (5, 2723344835, 'Spencer, Walker and Macejkovic', '2023-04-27');
insert into empresa (id_company, cuit_company, name_company, date_company) values (6, 2721410733, 'Rodriguez-Collier', '2020-07-07');
insert into empresa (id_company, cuit_company, name_company, date_company) values (7, 3756609081, 'Russel, Franecki and Sawayn', '2017-11-30');
insert into empresa (id_company, cuit_company, name_company, date_company) values (8, 2641104407, 'D''Amore, Hirthe and Jaskolski', '2018-06-01');
insert into empresa (id_company, cuit_company, name_company, date_company) values (9, 4482629707, 'Adams LLC', '2017-10-02');
insert into empresa (id_company, cuit_company, name_company, date_company) values (10, 7381192330, 'Nienow and Sons', '2017-03-12');
insert into empresa (id_company, cuit_company, name_company, date_company) values (11, 9501886174, 'Howe-Lehner', '2020-08-25');
insert into empresa (id_company, cuit_company, name_company, date_company) values (12, 1372356053, 'Braun-Dibbert', '2021-12-07');
insert into empresa (id_company, cuit_company, name_company, date_company) values (13, 2761669355, 'Morissette and Sons', '2023-08-16');
insert into empresa (id_company, cuit_company, name_company, date_company) values (14, 0570098521, 'Gottlieb LLC', '2019-12-13');
insert into empresa (id_company, cuit_company, name_company, date_company) values (15, 1507232225, 'Klein, Cruickshank and Botsford', '2019-06-27');
insert into empresa (id_company, cuit_company, name_company, date_company) values (16, 8272382679, 'Wisoky, Bruen and Wintheiser', '2019-10-12');
insert into empresa (id_company, cuit_company, name_company, date_company) values (17, 1185405364, 'Hayes-O''Connell', '2021-10-02');
insert into empresa (id_company, cuit_company, name_company, date_company) values (18, 2985590620, 'Paucek, Dicki and Ernser', '2021-08-25');
insert into empresa (id_company, cuit_company, name_company, date_company) values (19, 3040675389, 'Larson Inc', '2021-02-07');
insert into empresa (id_company, cuit_company, name_company, date_company) values (20, 0195928490, 'Conn-Harvey', '2018-04-16');
insert into empresa (id_company, cuit_company, name_company, date_company) values (21, 2627358405, 'Braun, Emmerich and Wuckert', '2017-02-22');
insert into empresa (id_company, cuit_company, name_company, date_company) values (22, 0762530316, 'Mraz-Sporer', '2020-06-06');
insert into empresa (id_company, cuit_company, name_company, date_company) values (23, 3419933886, 'Kuhn-Rath', '2018-07-07');
insert into empresa (id_company, cuit_company, name_company, date_company) values (24, 5730037945, 'Lueilwitz and Sons', '2017-02-10');
insert into empresa (id_company, cuit_company, name_company, date_company) values (25, 1115553267, 'Ryan-Hagenes', '2020-09-16');
insert into empresa (id_company, cuit_company, name_company, date_company) values (26, 5546751371, 'Conroy LLC', '2019-04-11');
insert into empresa (id_company, cuit_company, name_company, date_company) values (27, 4226823087, 'Rolfson-Schamberger', '2018-09-23');
insert into empresa (id_company, cuit_company, name_company, date_company) values (28, 9902003265, 'Lakin-Hahn', '2017-04-19');
insert into empresa (id_company, cuit_company, name_company, date_company) values (29, 1800057059, 'McKenzie, Funk and Durgan', '2019-03-07');
insert into empresa (id_company, cuit_company, name_company, date_company) values (30, 0439619858, 'Hahn-Olson', '2017-12-02');
insert into empresa (id_company, cuit_company, name_company, date_company) values (31, 6187600746, 'Jacobson, Hettinger and Stoltenberg', '2018-04-23');
insert into empresa (id_company, cuit_company, name_company, date_company) values (32, 0638054729, 'Stracke, Herman and Glover', '2022-07-20');
insert into empresa (id_company, cuit_company, name_company, date_company) values (33, 3598284543, 'Osinski-Bernier', '2022-04-12');
insert into empresa (id_company, cuit_company, name_company, date_company) values (34, 7499407969, 'Tromp-Greenholt', '2023-02-07');
insert into empresa (id_company, cuit_company, name_company, date_company) values (35, 4136021097, 'Wintheiser Inc', '2018-07-12');
insert into empresa (id_company, cuit_company, name_company, date_company) values (36, 7152640920, 'Kertzmann LLC', '2022-06-28');
insert into empresa (id_company, cuit_company, name_company, date_company) values (37, 0258961007, 'Stehr, Auer and Keeling', '2018-08-17');
insert into empresa (id_company, cuit_company, name_company, date_company) values (38, 8241951450, 'Brown Inc', '2022-11-26');
insert into empresa (id_company, cuit_company, name_company, date_company) values (39, 0111909457, 'Lowe and Sons', '2023-05-03');
insert into empresa (id_company, cuit_company, name_company, date_company) values (40, 3386642551, 'Tillman and Sons', '2021-08-26');
insert into empresa (id_company, cuit_company, name_company, date_company) values (41, 8292160655, 'Gibson, Boehm and Baumbach', '2020-02-26');
insert into empresa (id_company, cuit_company, name_company, date_company) values (42, 0227187776, 'Feil Group', '2022-01-18');
insert into empresa (id_company, cuit_company, name_company, date_company) values (43, 9444233979, 'Rohan and Sons', '2020-05-27');
insert into empresa (id_company, cuit_company, name_company, date_company) values (44, 8678630493, 'Mraz-Corkery', '2020-09-07');
insert into empresa (id_company, cuit_company, name_company, date_company) values (45, 7485663984, 'Thompson Inc', '2021-04-11');

/* pago */
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (1, 218693, 1, 1, '2023-03-31', '461 Sommers Place', 24);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (2, 246869, 2, 2, '2022-07-24', '7 Morning Parkway', 17);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (3, 254264, 3, 3, '2020-02-20', '22128 Arkansas Lane', 41);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (4, 317323, 4, 4, '2018-03-02', '6539 1st Circle', 10);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (5, 215552, 5, 5, '2021-09-25', '1936 Arrowood Road', 37);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (6, 320833, 6, 6, '2018-10-16', '51992 Redwing Center', 25);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (7, 216153, 7, 7, '2022-08-27', '385 Merrick Lane', 14);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (8, 322089, 8, 8, '2020-05-22', '16 Lighthouse Bay Park', 9);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (9, 281904, 9, 9, '2020-10-08', '889 Toban Terrace', 16);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (10, 305845, 10, 10, '2017-09-01', '79 Maryland Street', 12);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (11, 159167, 11, 11, '2017-02-23', '79 Maryland Street', 12);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (12, 276723, 12, 12, '2017-05-16', '22128 Arkansas Lane', 41);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (13, 316253, 13, 13, '2019-11-27', '515 Algoma Court', 5);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (14, 180332, 14, 14, '2021-10-07', '48 Manufacturers Plaza', 43);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (15, 276299, 15, 15, '2017-11-12', '836 Loomis Court', 13);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (16, 348818, 16, 16, '2019-12-06', '4 Fair Oaks Road', 8);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (17, 311520, 17, 17, '2020-01-01', '07405 Sunnyside Park', 1);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (18, 204973, 18, 18, '2023-08-13', '515 Algoma Court', 5);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (19, 288590, 19, 19, '2020-05-27', '881 Carberry Center', 27);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (20, 262569, 20, 20, '2018-04-23', '7 Morning Parkway', 17);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (21, 167899, 21, 21, '2021-12-17', '7 Morning Parkway', 17);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (22, 318749, 22, 22, '2022-12-20', '889 Toban Terrace', 16);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (23, 240110, 23, 23, '2020-12-16', '31 Westridge Pass', 42);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (24, 261834, 24, 24, '2023-08-02', '7 Morning Parkway', 17);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (25, 296128, 25, 25, '2020-05-23', '22128 Arkansas Lane', 41);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (26, 325386, 26, 26, '2023-05-18', '48 Manufacturers Plaza', 43);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (27, 159259, 27, 27, '2023-04-12', '79 Maryland Street', 12);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (28, 347444, 28, 28, '2021-04-08', '836 Loomis Court', 13);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (29, 179304, 29, 29, '2022-11-13', '329 Summerview Point', 34);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (30, 340276, 30, 30, '2022-01-25', '3 Artisan Place', 33);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (31, 165480, 31, 31, '2018-08-18', '3 Artisan Place', 33);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (32, 274365, 32, 32, '2020-05-02', '72 Hauk Terrace', 4);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (33, 226326, 33, 33, '2019-11-15', '9197 Oriole Terrace', 44);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (34, 241971, 34, 34, '2017-11-14', '3 Artisan Place', 33);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (35, 261511, 35, 35, '2021-12-26', '98 Katie Drive', 30);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (36, 158941, 36, 36, '2018-09-10', '8478 Farmco Junction', 39);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (37, 301299, 37, 37, '2018-01-28', '0148 Briar Crest Road', 19);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (38, 255991, 38, 38, '2020-09-09', '0 Dunning Crossing', 18);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (39, 248154, 39, 39, '2021-12-23', '385 Merrick Lane', 14);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (40, 284863, 40, 40, '2017-08-10', '889 Toban Terrace', 16);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (41, 195815, 41, 41, '2020-06-02', '98 Katie Drive', 30);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (42, 218213, 42, 42, '2019-09-11', '16 Lighthouse Bay Park', 9);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (43, 250715, 43, 43, '2023-03-14', '66445 Norway Maple Terrace', 29);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (44, 314881, 44, 44, '2019-09-15', '329 Summerview Point', 34);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (45, 319264, 45, 45, '2022-11-23', '515 Algoma Court', 5);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (46, 337674, 46, 46, '2019-09-02', '515 Algoma Court', 5);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (47, 348585, 47, 47, '2022-02-04', '72 Hauk Terrace', 4);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (48, 233920, 48, 48, '2018-06-04', '79 Maryland Street', 12);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (49, 178960, 49, 49, '2022-04-24', '3015 Cottonwood Parkway', 22);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (50, 282151, 50, 50, '2021-08-21', '26 Sloan Alley', 40);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (51, 160249, 51, 51, '2018-12-12', '26 Sloan Alley', 40);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (52, 305045, 52, 52, '2022-01-08', '515 Algoma Court', 5);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (53, 221627, 53, 53, '2018-01-17', '2679 Forest Drive', 45);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (54, 212931, 54, 54, '2021-01-08', '329 Summerview Point', 34);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (55, 158030, 55, 55, '2021-12-25', '467 Hazelcrest Street', 20);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (56, 207115, 56, 56, '2021-07-21', '3 Fallview Place', 7);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (57, 187494, 57, 57, '2020-02-17', '3015 Cottonwood Parkway', 22);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (58, 313557, 58, 58, '2017-08-04', '3 Artisan Place', 33);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (59, 188289, 59, 59, '2019-03-29', '881 Carberry Center', 27);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (60, 232112, 60, 60, '2022-05-17', '4 Cordelia Crossing', 2);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (61, 180318, 61, 61, '2020-08-28', '48 Manufacturers Plaza', 43);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (62, 282003, 62, 62, '2018-11-06', '894 Marcy Parkway', 15);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (63, 286044, 63, 63, '2021-08-24', '385 Merrick Lane', 14);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (64, 238876, 64, 64, '2021-03-09', '461 Sommers Place', 24);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (65, 294392, 65, 65, '2021-12-23', '98 Macpherson Street', 28);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (66, 271470, 66, 66, '2022-10-28', '22128 Arkansas Lane', 41);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (67, 312136, 67, 67, '2020-08-09', '87653 Homewood Junction', 11);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (68, 337004, 68, 68, '2019-02-12', '98 Macpherson Street', 28);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (69, 176003, 69, 69, '2018-07-30', '3 Artisan Place', 33);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (70, 327503, 70, 70, '2018-02-03', '515 Algoma Court', 5);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (71, 181678, 71, 71, '2021-01-25', '6539 1st Circle', 10);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (72, 248979, 72, 72, '2020-10-23', '31 Westridge Pass', 42);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (73, 244832, 73, 73, '2021-04-26', '0148 Briar Crest Road', 19);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (74, 263981, 74, 74, '2021-11-19', '60878 Merry Hill', 3);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (75, 322431, 75, 75, '2018-09-06', '7 Morning Parkway', 17);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (76, 177813, 76, 76, '2022-01-23', '87653 Homewood Junction', 11);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (77, 204347, 77, 77, '2022-05-31', '48 Manufacturers Plaza', 43);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (78, 212453, 78, 78, '2020-11-15', '329 Summerview Point', 34);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (79, 278679, 79, 79, '2020-09-27', '07405 Sunnyside Park', 1);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (80, 326680, 80, 80, '2022-06-01', '54 Bultman Parkway', 38);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (81, 328211, 81, 81, '2018-11-23', '4 Cordelia Crossing', 2);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (82, 318517, 82, 82, '2022-03-09', '3 Artisan Place', 33);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (83, 179124, 83, 83, '2022-10-25', '16 Lighthouse Bay Park', 9);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (84, 189569, 84, 84, '2017-06-06', '6539 1st Circle', 10);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (85, 234919, 85, 85, '2020-08-11', '51992 Redwing Center', 25);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (86, 337859, 86, 86, '2018-02-15', '87588 Dottie Lane', 26);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (87, 247737, 87, 87, '2023-06-19', '881 Carberry Center', 27);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (88, 270179, 88, 88, '2021-09-11', '54 Bultman Parkway', 38);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (89, 165407, 89, 89, '2017-07-27', '894 Marcy Parkway', 15);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (90, 271839, 90, 90, '2019-11-03', '07405 Sunnyside Park', 1);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (91, 303330, 91, 91, '2018-08-04', '98 Katie Drive', 30);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (92, 180130, 92, 92, '2018-04-25', '0 Dunning Crossing', 18);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (93, 290815, 93, 93, '2020-01-26', '07405 Sunnyside Park', 1);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (94, 344120, 94, 94, '2023-07-29', '830 Claremont Junction', 31);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (95, 174261, 95, 95, '2019-04-27', '4289 Becker Court', 23);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (96, 154562, 96, 96, '2020-01-09', '3 Artisan Place', 33);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (97, 289330, 97, 97, '2017-04-21', '4289 Becker Court', 23);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (98, 263181, 98, 98, '2020-01-24', '87653 Homewood Junction', 11);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (99, 174435, 99, 99, '2023-05-02', '4 Cordelia Crossing', 2);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (100, 228402, 100, 100, '2018-04-01', '22128 Arkansas Lane', 41);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (101, 187268, 101, 101, '2020-09-27', '3 Artisan Place', 33);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (102, 219267, 102, 102, '2020-05-25', '16 Esch Point', 32);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (103, 210192, 103, 103, '2019-04-28', '87588 Dottie Lane', 26);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (104, 220132, 104, 104, '2021-12-24', '3 Fallview Place', 7);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (105, 228160, 105, 105, '2023-07-13', '98 Katie Drive', 30);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (106, 317110, 106, 106, '2019-10-17', '7 Morning Parkway', 17);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (107, 259961, 107, 107, '2018-09-21', '3 Fallview Place', 7);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (108, 274836, 108, 108, '2020-05-25', '2679 Forest Drive', 45);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (109, 287170, 109, 109, '2021-06-27', '2679 Forest Drive', 45);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (110, 329848, 110, 110, '2022-02-09', '9197 Oriole Terrace', 44);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (111, 233553, 111, 111, '2021-11-19', '329 Summerview Point', 34);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (112, 150380, 112, 112, '2021-12-03', '1936 Arrowood Road', 37);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (113, 259337, 113, 113, '2019-10-18', '16 Lighthouse Bay Park', 9);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (114, 331448, 114, 114, '2017-11-22', '48 Manufacturers Plaza', 43);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (115, 188126, 115, 115, '2018-04-04', '22128 Arkansas Lane', 41);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (116, 236014, 116, 116, '2022-06-03', '79 Maryland Street', 12);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (117, 331662, 117, 117, '2022-10-27', '385 Merrick Lane', 14);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (118, 344408, 118, 118, '2021-08-15', '2679 Forest Drive', 45);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (119, 172166, 119, 119, '2020-11-25', '9197 Oriole Terrace', 44);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (120, 337098, 120, 120, '2019-11-26', '22128 Arkansas Lane', 41);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (121, 334647, 121, 121, '2022-10-01', '07405 Sunnyside Park', 1);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (122, 322996, 122, 122, '2019-02-24', '3 Artisan Place', 33);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (123, 228164, 123, 123, '2020-11-24', '84 Schmedeman Junction', 35);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (124, 259466, 124, 124, '2021-01-09', '22128 Arkansas Lane', 41);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (125, 300860, 125, 125, '2018-01-26', '98 Macpherson Street', 28);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (126, 260177, 126, 126, '2023-07-17', '16 Lighthouse Bay Park', 9);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (127, 279770, 127, 127, '2022-07-29', '87588 Dottie Lane', 26);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (128, 186560, 128, 128, '2023-03-26', '2697 Shasta Alley', 21);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (129, 280526, 129, 129, '2020-05-13', '16 Esch Point', 32);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (130, 347899, 130, 130, '2022-08-11', '4289 Becker Court', 23);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (131, 341650, 131, 131, '2018-06-09', '54 Bultman Parkway', 38);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (132, 245407, 132, 132, '2021-07-26', '894 Marcy Parkway', 15);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (133, 224920, 133, 133, '2017-09-21', '16 Esch Point', 32);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (134, 203775, 134, 134, '2021-12-07', '4 Fair Oaks Road', 8);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (135, 195003, 135, 135, '2023-02-06', '0 Dunning Crossing', 18);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (136, 294039, 136, 136, '2019-09-07', '3015 Cottonwood Parkway', 22);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (137, 248211, 137, 137, '2020-01-19', '2679 Forest Drive', 45);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (138, 222880, 138, 138, '2020-05-16', '51992 Redwing Center', 25);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (139, 272611, 139, 139, '2018-08-13', '894 Marcy Parkway', 15);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (140, 293114, 140, 140, '2023-02-24', '2679 Forest Drive', 45);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (141, 310849, 141, 141, '2020-04-16', '467 Hazelcrest Street', 20);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (142, 186921, 142, 142, '2020-09-27', '98 Katie Drive', 30);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (143, 317980, 143, 143, '2018-02-03', '385 Merrick Lane', 14);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (144, 342014, 144, 144, '2019-02-18', '4 Fair Oaks Road', 8);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (145, 267354, 145, 145, '2022-01-12', '3 Fallview Place', 7);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (146, 308467, 146, 146, '2018-02-04', '48 Manufacturers Plaza', 43);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (147, 242281, 147, 147, '2021-12-29', '2697 Shasta Alley', 21);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (148, 181472, 148, 148, '2019-07-02', '2679 Forest Drive', 45);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (149, 152364, 149, 149, '2017-11-11', '881 Carberry Center', 27);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (150, 342403, 150, 150, '2021-11-10', '881 Carberry Center', 27);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (151, 270130, 151, 151, '2019-10-24', '515 Algoma Court', 5);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (152, 344736, 152, 152, '2021-10-30', '72 Hauk Terrace', 4);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (153, 309745, 153, 153, '2023-01-04', '87588 Dottie Lane', 26);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (154, 296562, 154, 154, '2020-07-02', '7 Ramsey Street', 36);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (155, 246186, 155, 155, '2021-10-30', '60878 Merry Hill', 3);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (156, 278933, 156, 156, '2017-02-17', '31 Westridge Pass', 42);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (157, 294955, 157, 157, '2022-06-28', '9197 Oriole Terrace', 44);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (158, 340073, 158, 158, '2022-01-09', '22128 Arkansas Lane', 41);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (159, 222019, 159, 159, '2018-09-29', '60878 Merry Hill', 3);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (160, 241945, 160, 160, '2017-11-27', '830 Claremont Junction', 31);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (161, 219561, 161, 161, '2020-09-08', '98 Macpherson Street', 28);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (162, 303185, 162, 162, '2023-05-06', '8478 Farmco Junction', 39);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (163, 326334, 163, 163, '2018-03-02', '16 Esch Point', 32);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (164, 346400, 164, 164, '2017-11-10', '22128 Arkansas Lane', 41);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (165, 311778, 165, 165, '2020-10-06', '0 Dunning Crossing', 18);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (166, 287076, 166, 166, '2017-02-26', '3 Artisan Place', 33);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (167, 193617, 167, 167, '2018-06-11', '4289 Becker Court', 23);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (168, 232901, 168, 168, '2017-07-12', '8478 Farmco Junction', 39);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (169, 220112, 169, 169, '2020-06-29', '4 Fair Oaks Road', 8);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (170, 174305, 170, 170, '2020-02-26', '0148 Briar Crest Road', 19);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (171, 245331, 171, 171, '2017-04-12', '87653 Homewood Junction', 11);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (172, 331240, 172, 172, '2022-07-15', '4 Fair Oaks Road', 8);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (173, 241445, 173, 173, '2021-08-09', '7 Northport Avenue', 6);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (174, 323482, 174, 174, '2018-08-12', '72 Hauk Terrace', 4);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (175, 163328, 175, 175, '2019-06-04', '7 Northport Avenue', 6);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (176, 221446, 176, 176, '2019-12-28', '329 Summerview Point', 34);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (177, 194844, 177, 177, '2020-12-05', '4289 Becker Court', 23);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (178, 233734, 178, 178, '2021-07-13', '72 Hauk Terrace', 4);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (179, 237941, 179, 179, '2021-04-12', '467 Hazelcrest Street', 20);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (180, 230774, 180, 180, '2022-06-11', '3 Artisan Place', 33);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (181, 190554, 181, 181, '2018-11-27', '2697 Shasta Alley', 21);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (182, 188031, 182, 182, '2020-10-29', '4 Fair Oaks Road', 8);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (183, 270214, 183, 183, '2018-02-04', '16 Esch Point', 32);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (184, 240190, 184, 184, '2017-12-01', '84 Schmedeman Junction', 35);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (185, 340235, 185, 185, '2019-12-14', '4289 Becker Court', 23);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (186, 258138, 186, 186, '2022-07-24', '4 Fair Oaks Road', 8);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (187, 316710, 187, 187, '2022-02-08', '87653 Homewood Junction', 11);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (188, 289640, 188, 188, '2020-09-29', '51992 Redwing Center', 25);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (189, 348294, 189, 189, '2018-03-15', '7 Morning Parkway', 17);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (190, 240747, 190, 190, '2020-06-03', '4 Fair Oaks Road', 8);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (191, 180465, 191, 191, '2020-08-16', '9197 Oriole Terrace', 44);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (192, 204143, 192, 192, '2018-12-14', '2697 Shasta Alley', 21);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (193, 163071, 193, 193, '2023-05-31', '4 Fair Oaks Road', 8);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (194, 347595, 194, 194, '2020-05-10', '3 Artisan Place', 33);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (195, 304397, 195, 195, '2022-03-09', '7 Ramsey Street', 36);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (196, 255472, 196, 196, '2022-03-23', '2679 Forest Drive', 45);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (197, 332653, 197, 197, '2017-09-30', '4 Cordelia Crossing', 2);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (198, 192553, 198, 198, '2022-12-09', '0 Dunning Crossing', 18);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (199, 328392, 199, 199, '2018-02-03', '7 Ramsey Street', 36);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (200, 199069, 200, 200, '2020-07-09', '7 Northport Avenue', 6);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (201, 246293, 201, 201, '2023-01-08', '6539 1st Circle', 10);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (202, 324028, 202, 202, '2020-01-12', '3015 Cottonwood Parkway', 22);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (203, 221709, 203, 203, '2020-07-11', '6539 1st Circle', 10);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (204, 265405, 204, 204, '2021-01-23', '84 Schmedeman Junction', 35);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (205, 173896, 205, 205, '2020-10-26', '0 Dunning Crossing', 18);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (206, 328524, 206, 206, '2019-05-26', '7 Morning Parkway', 17);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (207, 263957, 207, 207, '2023-01-14', '07405 Sunnyside Park', 1);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (208, 187901, 208, 208, '2022-11-26', '894 Marcy Parkway', 15);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (209, 230842, 209, 209, '2021-08-05', '66445 Norway Maple Terrace', 29);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (210, 277933, 210, 210, '2022-04-10', '98 Macpherson Street', 28);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (211, 274652, 211, 211, '2019-11-27', '1936 Arrowood Road', 37);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (212, 330543, 212, 212, '2017-09-21', '72 Hauk Terrace', 4);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (213, 263189, 213, 213, '2020-08-06', '7 Northport Avenue', 6);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (214, 301840, 214, 214, '2019-09-25', '6539 1st Circle', 10);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (215, 225699, 215, 215, '2017-11-24', '84 Schmedeman Junction', 35);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (216, 233143, 216, 216, '2020-01-12', '4 Cordelia Crossing', 2);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (217, 302953, 217, 217, '2022-03-17', '98 Macpherson Street', 28);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (218, 306259, 218, 218, '2018-07-16', '07405 Sunnyside Park', 1);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (219, 271209, 219, 219, '2022-01-13', '84 Schmedeman Junction', 35);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (220, 288602, 220, 220, '2022-08-20', '4 Cordelia Crossing', 2);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (221, 302599, 221, 221, '2020-12-08', '2679 Forest Drive', 45);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (222, 300714, 222, 222, '2018-02-10', '07405 Sunnyside Park', 1);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (223, 237952, 223, 223, '2017-10-20', '2697 Shasta Alley', 21);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (224, 186442, 224, 224, '2021-10-08', '54 Bultman Parkway', 38);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (225, 243338, 225, 225, '2020-05-24', '515 Algoma Court', 5);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (226, 322841, 226, 226, '2019-12-10', '31 Westridge Pass', 42);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (227, 150095, 227, 227, '2017-05-22', '3 Artisan Place', 33);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (228, 232770, 228, 228, '2020-09-25', '98 Katie Drive', 30);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (229, 303286, 229, 229, '2023-08-01', '07405 Sunnyside Park', 1);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (230, 163401, 230, 230, '2020-07-15', '54 Bultman Parkway', 38);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (231, 213132, 231, 231, '2017-03-26', '8478 Farmco Junction', 39);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (232, 241944, 232, 232, '2019-04-13', '1936 Arrowood Road', 37);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (233, 217840, 233, 233, '2018-08-27', '9197 Oriole Terrace', 44);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (234, 281361, 234, 234, '2019-05-14', '98 Macpherson Street', 28);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (235, 257001, 235, 235, '2022-03-10', '2679 Forest Drive', 45);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (236, 158309, 236, 236, '2019-04-28', '836 Loomis Court', 13);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (237, 196714, 237, 237, '2021-01-17', '87588 Dottie Lane', 26);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (238, 313923, 238, 238, '2019-11-02', '4 Cordelia Crossing', 2);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (239, 244007, 239, 239, '2017-04-01', '3 Artisan Place', 33);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (240, 300217, 240, 240, '2020-07-30', '7 Morning Parkway', 17);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (241, 305732, 241, 241, '2022-06-16', '2679 Forest Drive', 45);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (242, 270201, 242, 242, '2022-07-01', '7 Northport Avenue', 6);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (243, 151351, 243, 243, '2022-03-09', '0 Dunning Crossing', 18);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (244, 312293, 244, 244, '2019-12-31', '98 Macpherson Street', 28);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (245, 283785, 245, 245, '2018-07-16', '07405 Sunnyside Park', 1);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (246, 264850, 246, 246, '2022-05-23', '0148 Briar Crest Road', 19);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (247, 334026, 247, 247, '2017-11-04', '8478 Farmco Junction', 39);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (248, 242695, 248, 248, '2017-12-25', '26 Sloan Alley', 40);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (249, 205252, 249, 249, '2021-08-24', '60878 Merry Hill', 3);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (250, 334832, 250, 250, '2017-09-11', '3 Fallview Place', 7);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (251, 181832, 251, 251, '2019-08-28', '31 Westridge Pass', 42);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (252, 153185, 252, 252, '2021-10-21', '0148 Briar Crest Road', 19);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (253, 222273, 253, 253, '2019-07-02', '54 Bultman Parkway', 38);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (254, 255817, 254, 254, '2018-06-09', '6539 1st Circle', 10);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (255, 330570, 255, 255, '2022-06-24', '894 Marcy Parkway', 15);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (256, 284874, 256, 256, '2023-04-14', '2679 Forest Drive', 45);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (257, 268694, 257, 257, '2019-05-27', '3 Fallview Place', 7);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (258, 317327, 258, 258, '2019-04-26', '0148 Briar Crest Road', 19);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (259, 201195, 259, 259, '2021-03-07', '2697 Shasta Alley', 21);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (260, 188516, 260, 260, '2020-11-30', '16 Esch Point', 32);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (261, 254817, 261, 261, '2022-05-09', '836 Loomis Court', 13);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (262, 299083, 262, 262, '2022-06-19', '461 Sommers Place', 24);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (263, 234055, 263, 263, '2019-06-01', '3 Fallview Place', 7);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (264, 274871, 264, 264, '2021-07-26', '4 Fair Oaks Road', 8);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (265, 244158, 265, 265, '2019-11-14', '7 Ramsey Street', 36);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (266, 157030, 266, 266, '2021-04-06', '51992 Redwing Center', 25);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (267, 231571, 267, 267, '2019-03-07', '1936 Arrowood Road', 37);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (268, 251939, 268, 268, '2020-08-30', '26 Sloan Alley', 40);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (269, 234582, 269, 269, '2020-09-15', '98 Katie Drive', 30);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (270, 285373, 270, 270, '2018-02-12', '830 Claremont Junction', 31);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (271, 343046, 271, 271, '2018-12-10', '60878 Merry Hill', 3);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (272, 181696, 272, 272, '2020-07-02', '515 Algoma Court', 5);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (273, 333144, 273, 273, '2020-09-29', '7 Morning Parkway', 17);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (274, 159496, 274, 274, '2018-08-06', '2679 Forest Drive', 45);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (275, 193330, 275, 275, '2020-11-10', '84 Schmedeman Junction', 35);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (276, 220113, 276, 276, '2021-02-04', '461 Sommers Place', 24);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (277, 333245, 277, 277, '2022-02-01', '16 Lighthouse Bay Park', 9);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (278, 170990, 278, 278, '2017-06-15', '31 Westridge Pass', 42);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (279, 258073, 279, 279, '2020-01-14', '87653 Homewood Junction', 11);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (280, 159180, 280, 280, '2021-06-03', '461 Sommers Place', 24);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (281, 275699, 281, 281, '2022-08-28', '4 Fair Oaks Road', 8);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (282, 260395, 282, 282, '2017-10-31', '72 Hauk Terrace', 4);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (283, 349085, 283, 283, '2018-04-11', '467 Hazelcrest Street', 20);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (284, 283971, 284, 284, '2018-02-22', '467 Hazelcrest Street', 20);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (285, 217715, 285, 285, '2018-10-03', '79 Maryland Street', 12);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (286, 299906, 286, 286, '2018-02-07', '8478 Farmco Junction', 39);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (287, 224513, 287, 287, '2023-01-01', '836 Loomis Court', 13);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (288, 317861, 288, 288, '2019-01-15', '87653 Homewood Junction', 11);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (289, 262870, 289, 289, '2022-07-12', '87588 Dottie Lane', 26);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (290, 264211, 290, 290, '2017-02-14', '385 Merrick Lane', 14);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (291, 299741, 291, 291, '2019-02-26', '26 Sloan Alley', 40);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (292, 340500, 292, 292, '2017-11-05', '84 Schmedeman Junction', 35);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (293, 193447, 293, 293, '2021-12-06', '515 Algoma Court', 5);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (294, 289403, 294, 294, '2020-02-12', '48 Manufacturers Plaza', 43);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (295, 222753, 295, 295, '2020-09-24', '16 Lighthouse Bay Park', 9);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (296, 172676, 296, 296, '2023-04-28', '1936 Arrowood Road', 37);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (297, 338394, 297, 297, '2020-10-13', '31 Westridge Pass', 42);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (298, 281317, 298, 298, '2023-07-30', '2679 Forest Drive', 45);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (299, 322833, 299, 299, '2022-03-12', '54 Bultman Parkway', 38);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (300, 223753, 300, 300, '2017-06-06', '98 Macpherson Street', 28);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (301, 157253, 301, 301, '2021-08-05', '3 Artisan Place', 33);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (302, 343516, 302, 302, '2019-07-29', '329 Summerview Point', 34);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (303, 209452, 303, 303, '2022-09-24', '72 Hauk Terrace', 4);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (304, 308671, 304, 304, '2020-02-18', '467 Hazelcrest Street', 20);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (305, 253306, 305, 305, '2020-08-25', '467 Hazelcrest Street', 20);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (306, 182551, 306, 306, '2018-02-12', '3 Fallview Place', 7);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (307, 285036, 307, 307, '2020-07-02', '4 Fair Oaks Road', 8);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (308, 287276, 308, 308, '2018-07-20', '3 Fallview Place', 7);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (309, 274265, 309, 309, '2017-11-25', '3015 Cottonwood Parkway', 22);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (310, 171510, 310, 310, '2019-09-30', '60878 Merry Hill', 3);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (311, 270294, 311, 311, '2018-12-25', '3015 Cottonwood Parkway', 22);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (312, 285588, 312, 312, '2019-07-17', '16 Esch Point', 32);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (313, 185517, 313, 313, '2023-03-24', '84 Schmedeman Junction', 35);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (314, 345839, 314, 314, '2017-04-08', '16 Esch Point', 32);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (315, 151533, 315, 315, '2023-07-03', '87653 Homewood Junction', 11);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (316, 341410, 316, 316, '2022-03-03', '889 Toban Terrace', 16);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (317, 197472, 317, 317, '2018-07-09', '881 Carberry Center', 27);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (318, 204641, 318, 318, '2020-01-29', '16 Esch Point', 32);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (319, 298289, 319, 319, '2022-06-01', '87588 Dottie Lane', 26);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (320, 298586, 320, 320, '2017-06-15', '4289 Becker Court', 23);

/* transporte */
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (1, 3, 10, 1);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (2, 4, 7, 2);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (3, 3, 7, 3);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (4, 7, 10, 4);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (5, 6, 5, 5);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (6, 3, 6, 6);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (7, 2, 5, 7);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (8, 5, 10, 8);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (9, 3, 3, 9);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (10, 8, 5, 10);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (11, 8, 4, 11);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (12, 3, 10, 12);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (13, 10, 4, 13);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (14, 9, 9, 14);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (15, 9, 10, 15);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (16, 5, 6, 16);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (17, 2, 2, 17);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (18, 5, 2, 18);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (19, 1, 3, 19);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (20, 2, 1, 20);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (21, 10, 5, 21);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (22, 1, 9, 22);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (23, 10, 3, 23);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (24, 2, 4, 24);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (25, 1, 7, 25);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (26, 2, 1, 26);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (27, 2, 9, 27);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (28, 4, 8, 28);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (29, 8, 10, 29);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (30, 6, 10, 30);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (31, 10, 4, 31);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (32, 2, 1, 32);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (33, 3, 9, 33);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (34, 1, 10, 34);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (35, 4, 9, 35);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (36, 3, 8, 36);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (37, 2, 7, 37);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (38, 1, 5, 38);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (39, 4, 3, 39);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (40, 1, 9, 40);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (41, 10, 3, 41);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (42, 5, 5, 42);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (43, 5, 8, 43);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (44, 4, 5, 44);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (45, 6, 6, 45);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (46, 2, 2, 46);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (47, 1, 9, 47);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (48, 5, 8, 48);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (49, 8, 6, 49);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (50, 6, 9, 50);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (51, 8, 3, 51);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (52, 6, 6, 52);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (53, 3, 9, 53);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (54, 3, 9, 54);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (55, 9, 5, 55);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (56, 6, 1, 56);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (57, 10, 2, 57);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (58, 5, 9, 58);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (59, 7, 5, 59);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (60, 9, 1, 60);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (61, 1, 5, 61);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (62, 1, 2, 62);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (63, 4, 7, 63);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (64, 5, 4, 64);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (65, 3, 3, 65);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (66, 5, 9, 66);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (67, 8, 4, 67);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (68, 2, 2, 68);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (69, 6, 6, 69);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (70, 2, 4, 70);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (71, 4, 9, 71);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (72, 6, 1, 72);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (73, 4, 3, 73);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (74, 5, 6, 74);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (75, 2, 6, 75);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (76, 9, 6, 76);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (77, 5, 4, 77);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (78, 9, 8, 78);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (79, 10, 3, 79);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (80, 4, 4, 80);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (81, 4, 6, 81);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (82, 7, 5, 82);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (83, 4, 2, 83);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (84, 7, 5, 84);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (85, 9, 6, 85);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (86, 10, 6, 86);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (87, 6, 3, 87);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (88, 9, 9, 88);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (89, 10, 10, 89);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (90, 10, 1, 90);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (91, 8, 2, 91);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (92, 8, 6, 92);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (93, 5, 6, 93);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (94, 9, 10, 94);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (95, 7, 7, 95);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (96, 2, 4, 96);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (97, 3, 9, 97);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (98, 7, 2, 98);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (99, 1, 2, 99);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (100, 4, 1, 100);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (101, 2, 4, 101);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (102, 7, 7, 102);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (103, 9, 4, 103);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (104, 2, 9, 104);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (105, 1, 1, 105);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (106, 2, 3, 106);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (107, 1, 9, 107);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (108, 10, 7, 108);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (109, 8, 4, 109);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (110, 3, 5, 110);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (111, 8, 3, 111);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (112, 5, 1, 112);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (113, 8, 6, 113);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (114, 3, 2, 114);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (115, 1, 1, 115);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (116, 4, 7, 116);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (117, 6, 4, 117);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (118, 8, 9, 118);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (119, 9, 4, 119);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (120, 4, 3, 120);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (121, 2, 10, 121);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (122, 4, 7, 122);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (123, 10, 10, 123);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (124, 9, 4, 124);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (125, 2, 7, 125);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (126, 3, 3, 126);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (127, 8, 2, 127);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (128, 1, 8, 128);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (129, 6, 10, 129);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (130, 4, 7, 130);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (131, 7, 8, 131);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (132, 1, 6, 132);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (133, 2, 5, 133);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (134, 7, 3, 134);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (135, 4, 10, 135);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (136, 2, 6, 136);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (137, 4, 4, 137);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (138, 3, 6, 138);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (139, 4, 2, 139);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (140, 4, 4, 140);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (141, 9, 10, 141);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (142, 9, 8, 142);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (143, 6, 10, 143);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (144, 10, 8, 144);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (145, 1, 3, 145);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (146, 2, 6, 146);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (147, 10, 8, 147);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (148, 8, 3, 148);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (149, 4, 3, 149);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (150, 6, 5, 150);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (151, 9, 10, 151);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (152, 1, 10, 152);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (153, 5, 5, 153);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (154, 7, 1, 154);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (155, 1, 6, 155);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (156, 8, 5, 156);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (157, 3, 2, 157);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (158, 10, 7, 158);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (159, 8, 3, 159);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (160, 4, 5, 160);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (161, 1, 6, 161);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (162, 1, 2, 162);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (163, 3, 5, 163);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (164, 7, 8, 164);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (165, 8, 4, 165);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (166, 8, 2, 166);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (167, 10, 9, 167);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (168, 6, 3, 168);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (169, 4, 9, 169);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (170, 5, 6, 170);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (171, 2, 6, 171);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (172, 10, 10, 172);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (173, 8, 3, 173);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (174, 3, 3, 174);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (175, 7, 9, 175);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (176, 6, 5, 176);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (177, 6, 6, 177);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (178, 1, 9, 178);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (179, 7, 2, 179);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (180, 3, 5, 180);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (181, 1, 1, 181);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (182, 1, 9, 182);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (183, 3, 4, 183);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (184, 1, 8, 184);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (185, 1, 1, 185);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (186, 9, 9, 186);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (187, 3, 3, 187);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (188, 1, 10, 188);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (189, 9, 10, 189);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (190, 2, 10, 190);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (191, 10, 8, 191);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (192, 5, 6, 192);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (193, 9, 3, 193);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (194, 9, 4, 194);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (195, 5, 10, 195);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (196, 9, 2, 196);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (197, 7, 3, 197);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (198, 1, 2, 198);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (199, 9, 4, 199);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (200, 10, 8, 200);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (201, 2, 9, 201);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (202, 5, 3, 202);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (203, 4, 8, 203);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (204, 10, 1, 204);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (205, 2, 1, 205);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (206, 9, 2, 206);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (207, 6, 2, 207);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (208, 2, 1, 208);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (209, 6, 1, 209);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (210, 3, 3, 210);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (211, 10, 1, 211);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (212, 8, 9, 212);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (213, 2, 2, 213);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (214, 7, 8, 214);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (215, 10, 8, 215);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (216, 2, 10, 216);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (217, 3, 2, 217);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (218, 6, 8, 218);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (219, 4, 2, 219);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (220, 5, 4, 220);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (221, 4, 10, 221);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (222, 5, 10, 222);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (223, 1, 4, 223);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (224, 1, 4, 224);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (225, 6, 6, 225);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (226, 5, 8, 226);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (227, 2, 3, 227);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (228, 6, 10, 228);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (229, 6, 8, 229);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (230, 7, 7, 230);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (231, 9, 9, 231);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (232, 10, 1, 232);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (233, 2, 2, 233);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (234, 7, 8, 234);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (235, 9, 10, 235);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (236, 4, 3, 236);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (237, 3, 10, 237);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (238, 10, 3, 238);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (239, 6, 1, 239);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (240, 7, 2, 240);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (241, 7, 4, 241);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (242, 4, 2, 242);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (243, 8, 6, 243);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (244, 1, 3, 244);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (245, 1, 1, 245);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (246, 6, 4, 246);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (247, 2, 9, 247);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (248, 8, 8, 248);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (249, 6, 8, 249);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (250, 10, 4, 250);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (251, 7, 8, 251);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (252, 5, 1, 252);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (253, 5, 4, 253);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (254, 9, 6, 254);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (255, 2, 8, 255);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (256, 3, 6, 256);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (257, 9, 5, 257);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (258, 5, 8, 258);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (259, 1, 3, 259);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (260, 9, 6, 260);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (261, 6, 5, 261);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (262, 9, 4, 262);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (263, 8, 7, 263);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (264, 10, 6, 264);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (265, 4, 3, 265);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (266, 7, 2, 266);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (267, 2, 7, 267);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (268, 9, 8, 268);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (269, 6, 10, 269);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (270, 6, 8, 270);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (271, 9, 10, 271);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (272, 9, 6, 272);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (273, 5, 4, 273);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (274, 7, 8, 274);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (275, 1, 4, 275);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (276, 5, 3, 276);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (277, 4, 5, 277);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (278, 5, 5, 278);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (279, 6, 2, 279);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (280, 1, 1, 280);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (281, 8, 7, 281);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (282, 5, 7, 282);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (283, 3, 6, 283);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (284, 3, 4, 284);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (285, 4, 3, 285);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (286, 4, 1, 286);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (287, 4, 4, 287);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (288, 2, 2, 288);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (289, 9, 9, 289);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (290, 10, 8, 290);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (291, 4, 7, 291);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (292, 5, 4, 292);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (293, 1, 7, 293);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (294, 2, 3, 294);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (295, 1, 2, 295);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (296, 6, 10, 296);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (297, 9, 9, 297);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (298, 6, 8, 298);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (299, 5, 8, 299);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (300, 6, 3, 300);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (301, 10, 3, 301);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (302, 5, 7, 302);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (303, 10, 3, 303);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (304, 1, 2, 304);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (305, 5, 6, 305);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (306, 7, 4, 306);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (307, 3, 4, 307);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (308, 5, 3, 308);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (309, 4, 1, 309);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (310, 8, 6, 310);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (311, 4, 6, 311);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (312, 10, 9, 312);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (313, 1, 2, 313);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (314, 9, 8, 314);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (315, 4, 4, 315);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (316, 10, 1, 316);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (317, 10, 4, 317);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (318, 4, 6, 318);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (319, 7, 9, 319);
insert into transporte (id_transport, id_driver, id_truck, id_pay) values (320, 8, 5, 320);


/* producto */
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (1, 'Lamb - Bones', 'Ext carot art lig-epist', false, 20.6, 952, 1);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (2, 'Sobe - Tropical Energy', 'Arth/pros rem wo re-wrst', false, 44.6, 554, 2);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (3, 'Rye Special Old', 'Tarsal tunnel release', false, 21.5, 542, 3);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (4, 'Galliano', 'Cystocel/rectocel repair', true, 8.1, 572, 4);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (5, 'Veal - Inside', 'Revision of tracheostomy', true, 24.7, 916, 5);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (6, 'Garbage Bag - Clear', 'Metacarp/carp sequestrec', true, 17.9, 718, 6);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (7, 'Pork - Smoked Back Bacon', 'Inf liquid brachy isotop', false, 37.2, 752, 7);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (8, 'Bulgar', 'Excision of vessel NOS', true, 13.8, 629, 8);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (9, 'Bread Crumbs - Panko', 'Vasectomy', false, 34.2, 966, 9);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (10, 'Soup - Knorr, Veg / Beef', 'Arthrodesis of elbow', true, 9.1, 520, 10);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (11, 'Pecan Raisin - Tarts', 'Activ musculosk exer NEC', false, 28.5, 777, 11);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (12, 'Appetizer - Smoked Salmon / Dill', 'Unilat exten simp mastec', true, 41.7, 590, 12);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (13, 'Vector Energy Bar', 'Elevate skull fx fragmnt', true, 33.1, 674, 13);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (14, 'Flower - Commercial Bronze', 'Urethroves junct plicat', true, 47.9, 820, 14);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (15, 'Bacardi Raspberry', 'Uterine art emb w/o coil', true, 45.8, 714, 15);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (16, 'Pepsi - Diet, 355 Ml', 'Micro exam-lower GI NEC', true, 39.9, 551, 16);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (17, 'Goat - Whole Cut', 'Clos cereb meninges bx', true, 47.4, 982, 17);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (18, 'Lemonade - Black Cherry, 591 Ml', 'Anterior chamber op NEC', true, 49.7, 728, 18);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (19, 'Duck - Breast', 'Occlude abd vein NEC', true, 39.5, 551, 19);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (20, 'Tea - English Breakfast', 'Culdoscopy', true, 8.9, 905, 20);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (21, 'Salt And Pepper Mix - Black', 'Evac ob hemat vulva/vag', false, 20.5, 591, 21);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (22, 'Thyme - Dried', 'Epikeratophakia', false, 4.2, 630, 22);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (23, 'Mushroom - Chantrelle, Fresh', 'Remov ureteral drain', true, 18.4, 873, 23);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (24, 'Garlic - Elephant', 'Lt heart angiocardiogram', true, 26.4, 841, 24);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (25, 'Onions - Vidalia', 'Cardiotomy', true, 50.0, 654, 25);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (26, 'Tilapia - Fillets', 'Muscle or fascia graft', false, 13.3, 866, 26);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (27, 'Bread - 10 Grain Parisian', 'Tot rep truncus arterios', false, 35.3, 653, 27);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (28, 'Bread - Raisin', 'Incis cx to assist deliv', false, 6.6, 671, 28);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (29, 'Flavouring - Rum', 'Eye fluorescein angiogra', false, 35.3, 617, 29);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (30, 'Tarts Assorted', 'Removal of FB NOS', false, 36.3, 827, 30);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (31, 'Cheese - Mozzarella, Buffalo', 'Closed brain biopsy', true, 41.9, 725, 31);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (32, 'Blueberries', 'Biliary tract x-ray NEC', true, 45.5, 518, 32);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (33, 'Corn - Mini', 'Hip surface, cermc/cermc', true, 47.9, 532, 33);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (34, 'Doilies - 12, Paper', 'Transab cerclage cervix', false, 21.5, 867, 34);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (35, 'Mix - Cocktail Ice Cream', 'Exc maj les lid ful-thic', true, 6.6, 844, 35);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (36, 'Lid Coffee Cup 8oz Blk', 'Suture anal laceration', false, 3.9, 858, 36);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (37, 'Dill Weed - Dry', 'Local renal perfusion', false, 1.6, 783, 37);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (38, 'Lid - 10,12,16 Oz', 'Pericolost hernia repair', true, 49.8, 722, 38);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (39, 'Langers - Cranberry Cocktail', 'Pineal gland incision', true, 10.4, 643, 39);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (40, 'Cheese - Gouda', 'Carotid pulse tracing', true, 30.9, 517, 40);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (41, 'Dome Lid Clear P92008h', 'Fallop tube repair NEC', false, 34.4, 977, 41);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (42, 'Longos - Chicken Wings', 'Canaliculus repair', false, 48.2, 521, 42);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (43, 'Soup - Campbells Beef Stew', 'Thor vessel resect/anast', false, 49.5, 989, 43);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (44, 'Ice Cream - Chocolate', 'Pros rep ventrc def-clos', true, 27.5, 671, 44);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (45, 'Goat - Leg', 'Lam keratplast w autgrft', false, 1.5, 592, 45);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (46, 'Beef - Tender Tips', 'Instrument delivery NEC', true, 8.6, 519, 46);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (47, 'Cookies Oatmeal Raisin', 'Ing hernia rep-graft NOS', true, 40.9, 790, 47);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (48, 'Lettuce - Romaine', 'Hysterectomy NEC/NOS', false, 33.0, 521, 48);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (49, 'Cheese - La Sauvagine', 'Pyeloscopy', true, 36.8, 710, 49);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (50, 'Energy Drink - Franks Original', 'Open reduct face fx NEC', true, 33.0, 864, 50);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (51, 'Bar - Sweet And Salty Chocolate', 'Lung transplant NOS', true, 2.9, 763, 51);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (52, 'Eggwhite Frozen', 'Aortocor bypas-3 cor art', false, 31.6, 863, 52);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (53, 'Squid - U 5', 'Carotid pulse tracing', false, 1.2, 614, 53);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (54, 'Swordfish Loin Portions', 'Open fx site debride NEC', true, 48.3, 926, 54);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (55, 'Beans - Yellow', 'Thoracic duct fistulizat', true, 37.6, 847, 55);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (56, 'Bag Clear 10 Lb', 'Electrocoag rect les NEC', false, 38.6, 760, 56);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (57, 'Bread - Assorted Rolls', 'Oth metac/carp rep/plast', true, 25.6, 800, 57);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (58, 'Apple - Delicious, Red', 'Opn bi dr/in ing hrn NEC', false, 27.2, 649, 58);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (59, 'Flour - Pastry', 'Coronary arteriogram NEC', false, 46.1, 715, 59);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (60, 'Mushroom - Chantrelle, Fresh', 'Activ musculosk exer NEC', false, 11.2, 524, 60);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (61, 'Currants', 'Closed pulmon valvotomy', true, 12.5, 922, 61);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (62, 'Ice Cream Bar - Hageen Daz To', 'Wide excision of lip les', true, 30.2, 867, 62);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (63, 'Cookies - Assorted', 'Xtraoc mus op/detach NEC', true, 1.3, 836, 63);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (64, 'Chestnuts - Whole,canned', 'Limited consultation', false, 22.9, 707, 64);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (65, 'Compound - Mocha', 'Intravascul imaging NOS', false, 48.7, 950, 65);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (66, 'Sugar - Brown, Individual', 'Lap umbil hernia-graft', false, 39.4, 985, 66);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (67, 'Cheese - Cottage Cheese', 'Lid marg recon-part thic', true, 20.9, 980, 67);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (68, 'Wine - White, Lindemans Bin 95', 'Oth lo vision aid dispen', true, 35.4, 616, 68);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (69, 'Pastry - French Mini Assorted', 'Cell blk/pap-musculoskel', false, 11.5, 727, 69);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (70, 'Pepper - Black, Crushed', 'Adrenal lesion excision', true, 12.8, 685, 70);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (71, 'Cheese - Cheddar, Mild', 'Arterial bld gas measure', true, 29.4, 854, 71);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (72, 'Food Colouring - Red', 'D & C for preg terminat', true, 23.5, 854, 72);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (73, 'Turkey - Oven Roast Breast', 'Thorac esophagoenter NEC', false, 33.8, 802, 73);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (74, 'Wine - Placido Pinot Grigo', 'Sing source radiosurgery', true, 43.1, 535, 74);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (75, 'Cake - Miini Cheesecake Cherry', 'Soft tissue dx proc NEC', false, 4.4, 844, 75);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (76, 'Cookie Dough - Oatmeal Rasin', 'Destruct mediastin les', false, 46.8, 525, 76);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (77, 'Appetizer - Chicken Satay', 'Other destru pancrea les', false, 45.6, 656, 77);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (78, 'V8 - Berry Blend', 'Repair vess w tis patch', true, 9.8, 939, 78);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (79, 'Persimmons', 'Hip surface, metal/metal', false, 23.4, 781, 79);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (80, 'Beef - Bones, Marrow', 'Insert 1 vascular stent', false, 20.4, 839, 80);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (81, 'Magnotta - Bel Paese White', 'Excise bone for grft NOS', true, 5.4, 833, 81);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (82, 'Pizza Pizza Dough', 'Thymus biopsy', false, 10.0, 611, 82);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (83, 'Alize Sunset', 'Unil breast injec-augmen', true, 45.8, 655, 83);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (84, 'Wine - Malbec Trapiche Reserve', 'Perc abltn liver les/tis', true, 21.2, 610, 84);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (85, 'Beer - True North Strong Ale', 'After-cataract excision', false, 42.2, 509, 85);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (86, 'Lamb - Whole Head Off', 'Lap indir ing hern-graft', true, 1.4, 858, 86);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (87, 'Vacuum Bags 12x16', 'Tongue operation NEC', false, 32.7, 696, 87);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (88, 'Salami - Genova', 'Total hepatectomy', true, 37.8, 868, 88);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (89, 'Pastry - French Mini Assorted', 'Lap gastric restric proc', true, 33.8, 846, 89);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (90, 'Macaroons - Homestyle Two Bit', 'Insert ves-to-ves cannul', true, 11.7, 890, 90);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (91, 'Squash - Guords', 'Thumb reconstruction NEC', true, 4.6, 502, 91);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (92, 'Pop Shoppe Cream Soda', 'Eye/orbit inj repair NEC', true, 10.8, 728, 92);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (93, 'Appetizer - Assorted Box', 'Culture-blood', false, 34.5, 866, 93);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (94, 'Brownies - Two Bite, Chocolate', 'Micro exam-musculosk NEC', true, 21.8, 826, 94);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (95, 'Longan', 'Control of epistaxis NOS', false, 32.2, 502, 95);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (96, 'The Pop Shoppe Pinapple', 'Repair of spleen', false, 34.8, 899, 96);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (97, 'Sesame Seed Black', 'Conjunctivocystorhinost', false, 32.8, 983, 97);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (98, 'Meldea Green Tea Liquor', 'Gas hysterosalpingogram', true, 3.0, 800, 98);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (99, 'Tomato - Peeled Italian Canned', 'Endosc sm bowel thru st', false, 32.2, 891, 99);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (100, 'Dasheen', 'Suture penile laceration', true, 28.1, 859, 100);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (101, 'Sandwich Wrap', 'Contr semin vesiculogram', false, 34.6, 622, 101);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (102, 'Quail - Jumbo', 'Periph nerve dx proc NEC', false, 29.4, 941, 102);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (103, 'Soup - Knorr, Chicken Gumbo', 'Repair of cleft lip', true, 40.0, 933, 103);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (104, 'Wine - Rhine Riesling Wolf Blass', 'Radioisot teleradiother', true, 16.1, 637, 104);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (105, 'Pate - Liver', 'C & s NEC', true, 38.3, 872, 105);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (106, 'Ginger - Pickled', 'Reclose post op disrupt', true, 10.1, 747, 106);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (107, 'Chives - Fresh', 'Remov intralum vag FB', true, 40.9, 669, 107);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (108, 'Energy Drink - Franks Original', 'Transureteroureterostomy', true, 37.2, 569, 108);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (109, 'Plasticforkblack', 'High-dose infusion IL-2', false, 31.0, 960, 109);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (110, 'Hog / Sausage Casing - Pork', 'Other muscle transposit', true, 35.9, 609, 110);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (111, 'Syrup - Monin, Amaretta', 'Temp detach >1 xtroc mus', true, 32.8, 567, 111);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (112, 'Cape Capensis - Fillet', 'Limb lengthn-metatar/tar', false, 43.2, 942, 112);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (113, 'Ice Cream - Strawberry', 'Excis ampulla of vater', true, 37.1, 580, 113);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (114, 'Bread - Pain Au Liat X12', 'Dental x-ray NEC', true, 4.7, 507, 114);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (115, 'Spinach - Baby', 'Keratomileusis', false, 25.5, 874, 115);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (116, 'Wine - Rosso Toscano Igt', 'Inc soft tissue hand NEC', false, 2.7, 951, 116);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (117, 'Shrimp - 31/40', 'Bilat adrenal explorat', true, 11.7, 897, 117);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (118, 'Wine - Lou Black Shiraz', 'Int fix-no fx reduct NEC', false, 14.0, 502, 118);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (119, 'Canada Dry', 'Cervical lymphangiogram', false, 2.1, 981, 119);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (120, 'Banana - Green', 'Myelomeningocel repair', false, 36.3, 799, 120);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (121, 'Pepper - Chillies, Crushed', 'Five-in-one knee repair', false, 4.3, 666, 121);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (122, 'Pepper - Green Thai', 'Lung laceration closure', true, 19.8, 592, 122);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (123, 'Onion - Dried', 'Lac canaliculi incision', true, 17.1, 848, 123);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (124, 'Turkey - Oven Roast Breast', 'Periprostatic incision', true, 9.0, 516, 124);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (125, 'Pork - Sausage Casing', 'Cell blk/pap-integument', false, 40.2, 863, 125);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (126, 'Mints - Striped Red', 'Renal repair NEC', false, 16.3, 761, 126);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (127, 'Pasta - Fusili, Dry', 'Ext maxillary antrot NEC', false, 24.8, 513, 127);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (128, 'Wood Chips - Regular', 'Other therapeutic ultsnd', true, 33.9, 633, 128);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (129, 'Initation Crab Meat', 'Excision of lip les NEC', false, 14.4, 564, 129);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (130, 'V8 Pet', 'Nephrocystanastomosi NOS', false, 17.5, 523, 130);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (131, 'Crab - Meat Combo', 'Labial frenotomy', true, 16.3, 561, 131);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (132, 'Eggplant - Regular', 'Rad dissec periaort node', false, 48.2, 955, 132);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (133, 'Oats Large Flake', 'Destruct facial bone les', false, 21.7, 527, 133);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (134, 'Carbonated Water - White Grape', 'Partial esophagectomy', false, 24.9, 568, 134);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (135, 'Lettuce - Sea / Sea Asparagus', 'Lower leg/ankle reattach', true, 15.1, 827, 135);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (136, 'Veal - Bones', 'Patellar stabilization', false, 23.0, 954, 136);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (137, 'Vinegar - Champagne', 'Exc of accessory spleen', true, 20.1, 966, 137);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (138, 'Doilies - 10, Paper', 'Reopen craniotomy site', true, 2.5, 524, 138);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (139, 'Rosemary - Primerba, Paste', 'Exploratory thoracotomy', true, 14.8, 713, 139);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (140, 'Chips Potato Salt Vinegar 43g', 'Excis les lacrimal gland', false, 23.2, 993, 140);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (141, 'Sea Bass - Whole', 'Vital capacity determin', false, 40.1, 902, 141);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (142, 'Loquat', 'Pericardial biopsy', true, 7.1, 754, 142);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (143, 'Wine - Chablis J Moreau Et Fils', 'Pancreatic operation NEC', true, 47.4, 546, 143);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (144, 'Trout - Hot Smkd, Dbl Fillet', 'Bone graft NOS', false, 44.5, 612, 144);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (145, 'Herb Du Provence - Primerba', 'Oth lap loc exc dest ova', false, 7.9, 602, 145);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (146, 'Tray - 12in Rnd Blk', 'Comprehensive consultat', false, 19.7, 612, 146);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (147, 'Butcher Twine 4r', 'Opn/oth part gastrectomy', true, 21.3, 844, 147);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (148, 'Artichokes - Jerusalem', 'Conduit left ventr-aorta', false, 30.6, 972, 148);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (149, 'Stock - Beef, Brown', 'Nasal fistula closure', false, 6.4, 655, 149);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (150, 'Ice Cream - Super Sandwich', 'Suture breast laceration', true, 3.5, 966, 150);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (151, 'Crab Brie In Phyllo', 'Impl other limb length', false, 22.7, 969, 151);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (152, 'Tofu - Firm', 'Sialoadenectomy NOS', false, 20.7, 664, 152);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (153, 'Ginger - Crystalized', 'Oth laryngeal operation', false, 23.4, 966, 153);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (154, 'Mangostein', 'Intra-amnion inj for ab', false, 7.1, 918, 154);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (155, 'Goldschalger', 'Percutaneous angioscopy', false, 2.6, 808, 155);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (156, 'Pastry - Plain Baked Croissant', 'Choledochoenterostomy', true, 20.5, 576, 156);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (157, 'Kumquat', 'Local sm bowel perfusion', true, 18.2, 729, 157);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (158, 'Beef - Bones, Marrow', 'Intra-abd venous shunt', false, 33.9, 613, 158);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (159, 'Cookie Dough - Double', 'Lacrimal sys dx proc NEC', true, 45.4, 769, 159);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (160, 'Chickensplit Half', 'Removal of cement spacer', false, 40.2, 655, 160);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (161, 'Soup - Campbells Tomato Ravioli', 'Other CAS', true, 49.9, 724, 161);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (162, 'Cardamon Ground', 'Corneal repair NEC', true, 40.9, 990, 162);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (163, 'Pasta - Fett Alfredo, Single Serve', 'Lid reconst w skin graft', false, 49.3, 710, 163);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (164, 'Hersey Shakes', 'Limb lengthn-metatar/tar', false, 10.2, 883, 164);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (165, 'V8 - Berry Blend', 'Aortcor bypas-4+ cor art', false, 46.5, 599, 165);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (166, 'Wine - Cava Aria Estate Brut', 'Syndactyly correction', false, 4.1, 998, 166);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (167, 'Coffee - Almond Amaretto', 'Anal fistulotomy', true, 21.0, 661, 167);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (168, 'Wine - Red, Gamay Noir', 'Suture tendn sheath hand', true, 1.5, 856, 168);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (169, 'Pastry - Key Limepoppy Seed Tea', 'Wound catheter irrigat', false, 7.5, 584, 169);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (170, 'Spinach - Spinach Leaf', 'Contr thor arteriogr NEC', false, 2.6, 693, 170);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (171, 'Aspic - Amber', 'Remove dental prosthesis', true, 29.2, 523, 171);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (172, 'Bread Country Roll', 'Limb shorten-tib/fibula', true, 26.1, 906, 172);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (173, 'Cake - Pancake', 'Destruct abd wall lesion', true, 49.7, 842, 173);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (174, 'Coffee - Almond Amaretto', 'Sutur capsul/ligamen arm', false, 34.0, 935, 174);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (175, 'Fruit Salad Deluxe', 'Spermatic cord incision', false, 31.7, 998, 175);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (176, 'True - Vue Containers', 'Bladder diagnos proc NEC', false, 30.4, 713, 176);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (177, 'Sugar - Fine', 'Cystotomy NEC', true, 47.6, 922, 177);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (178, 'Flour - Bread', 'Manual exam of breast', true, 11.7, 709, 178);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (179, 'Loaf Pan - 2 Lb, Foil', 'Revision of tracheostomy', false, 8.7, 796, 179);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (180, 'Pork - Loin, Bone - In', 'Arterial catheterization', false, 32.0, 954, 180);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (181, 'Cookie Trail Mix', 'Skel xray-upper limb NOS', false, 47.6, 982, 181);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (182, 'Soap - Mr.clean Floor Soap', 'Replace indwelling cath', false, 24.2, 624, 182);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (183, 'Dooleys Toffee', 'Radical prostatectomy', false, 43.6, 807, 183);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (184, 'Shrimp - 16/20, Peeled Deviened', 'Retrogr cystourethrogram', false, 49.9, 787, 184);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (185, 'Tomato - Green', 'Sm bowel exteriorization', true, 37.6, 879, 185);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (186, 'Goulash Seasoning', 'Open red-sep epiphy NOS', true, 9.8, 809, 186);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (187, 'Wine - Niagara Peninsula Vqa', 'Loc exc les metatar/tar', false, 16.9, 910, 187);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (188, 'Sugar - Individual Portions', 'Hand muscle reattachment', true, 7.9, 592, 188);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (189, 'Olives - Morracan Dired', 'Contrast laryngogram', false, 32.4, 856, 189);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (190, 'Pomello', 'Chorioret les destr NEC', false, 29.3, 921, 190);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (191, 'Wine - Sake', 'Eye examination NOS', true, 17.2, 641, 191);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (192, 'Langers - Cranberry Cocktail', 'Pros rep ventrc def-clos', true, 1.4, 874, 192);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (193, 'Cherries - Bing, Canned', 'Chest wall biopsy', true, 47.1, 803, 193);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (194, 'Beans - Yellow', 'Injection of larynx', false, 23.9, 786, 194);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (195, 'Dasheen', 'Clos mediastinal biopsy', false, 12.1, 867, 195);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (196, 'Raspberries - Fresh', 'Periph nerve div NEC', true, 48.5, 581, 196);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (197, 'Extract - Raspberry', 'Endosc remove panc stone', false, 43.8, 520, 197);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (198, 'Juice - Clamato, 341 Ml', 'Skull x-ray NEC', true, 26.2, 699, 198);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (199, 'Wine - Chablis J Moreau Et Fils', 'Closed biopsy of tongue', false, 4.1, 736, 199);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (200, 'Bread - Corn Muffaleta Onion', 'Tendon reattachment', true, 36.5, 728, 200);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (201, 'Cornflakes', 'Hepatic injection NEC', true, 26.7, 555, 201);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (202, 'Cheese - Provolone', 'Other repair of joint', false, 48.7, 567, 202);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (203, 'Lemonade - Pineapple Passion', 'Reimplan aberr renal ves', false, 6.6, 997, 203);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (204, 'Venison - Ground', 'Thoracic endarterectomy', false, 38.2, 846, 204);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (205, 'Roe - Lump Fish, Red', 'Unilat thyroid lobectomy', false, 38.6, 547, 205);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (206, 'Eel Fresh', 'Lap appendectomy', true, 42.4, 746, 206);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (207, 'Sauce - Soya, Light', 'Excision thyroid lesion', true, 30.3, 549, 207);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (208, 'Food Colouring - Pink', 'Other tenoplasty of hand', true, 26.9, 647, 208);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (209, 'Juice - Pineapple, 341 Ml', 'Therapeu erythropheresis', false, 23.4, 753, 209);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (210, 'Filling - Mince Meat', 'Revise sm bowel anastom', true, 14.2, 816, 210);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (211, 'V8 - Tropical Blend', 'Cell blk/pap-lymph sys', true, 6.4, 946, 211);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (212, 'Beer - Tetleys', 'Oth endo proc oth vessel', false, 9.1, 891, 212);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (213, 'Bread - Bistro White', 'Wrist synovectomy', true, 11.9, 966, 213);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (214, 'Drambuie', 'Unilat adrenal explorat', true, 9.4, 918, 214);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (215, 'Nut - Pistachio, Shelled', 'Cde for obstruction NEC', false, 40.3, 836, 215);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (216, 'Cookie - Dough Variety', 'Part breech extract NEC', true, 18.3, 664, 216);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (217, 'Persimmons', 'Cruciate lig repair NEC', true, 25.4, 597, 217);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (218, 'Pop - Club Soda Can', 'Total elbow replacement', false, 7.3, 540, 218);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (219, 'Nori Sea Weed - Gold Label', 'Intravasc msmnt cor art', false, 49.4, 636, 219);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (220, 'Cheese - Havarti, Roasted Garlic', 'Closed pulmon valvotomy', true, 4.7, 798, 220);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (221, 'Flax Seed', 'Urinary manometry', false, 47.9, 917, 221);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (222, 'Swordfish Loin Portions', 'Remove bile duct prosth', false, 32.4, 656, 222);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (223, 'Icecream Cone - Areo Chocolate', 'Retroperitoneal xray NEC', false, 3.0, 931, 223);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (224, 'Chicken - Ground', 'Pass musculosk exer NEC', false, 13.3, 621, 224);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (225, 'Sauce - Hp', 'Finger reattachment', true, 24.6, 633, 225);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (226, 'Sambuca Cream', 'Manual reduc rect prolap', true, 29.0, 842, 226);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (227, 'Milk - Chocolate 500ml', 'Thyroid field aspiration', true, 27.1, 819, 227);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (228, 'Oven Mitts - 15 Inch', 'Part gast w jej transpos', false, 37.4, 798, 228);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (229, 'Potato - Sweet', 'Oth plastic repair palat', true, 47.7, 639, 229);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (230, 'Country Roll', 'Other plastic ops muscle', true, 39.8, 643, 230);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (231, 'Lentils - Green Le Puy', 'Rep vaginoent fistul NEC', true, 19.8, 620, 231);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (232, 'Salmon - Atlantic, Fresh, Whole', 'Remov imp dev-tib/fibula', true, 26.4, 987, 232);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (233, 'Pasta - Angel Hair', 'Tympanosympathectomy', false, 7.8, 716, 233);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (234, 'Bread - Rosemary Focaccia', 'Open periph nerve biopsy', false, 23.2, 572, 234);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (235, 'Hipnotiq Liquor', 'Culdocentesis', true, 29.3, 772, 235);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (236, 'Hand Towel', 'Micro exam-periton NEC', true, 2.6, 736, 236);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (237, 'Pepper - Jalapeno', 'Oth extraoc mus-tend op', false, 33.2, 905, 237);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (238, 'Grand Marnier', 'Other arthrotomy NOS', true, 37.0, 851, 238);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (239, 'Bread - Dark Rye, Loaf', 'Parasitology-lower GI', true, 42.7, 947, 239);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (240, 'Bagel - Sesame Seed Presliced', 'Rev knee replace-patella', true, 4.2, 944, 240);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (241, 'Extract - Rum', 'Intravascul imaging NEC', false, 44.0, 825, 241);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (242, 'Brownies - Two Bite, Chocolate', 'Partial splenectomy', true, 26.7, 887, 242);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (243, 'Tomatillo', 'Electroencephalogram', false, 15.6, 993, 243);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (244, 'Wine - Shiraz South Eastern', 'Ext carot art lig-epist', false, 49.0, 507, 244);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (245, 'Pasta - Agnolotti - Butternut', 'Oth unilat oophorectomy', false, 18.0, 581, 245);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (246, 'Lid - 3oz Med Rec', 'Adjust gast restrict dev', true, 14.7, 621, 246);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (247, 'Venison - Ground', 'Other tenoplasty of hand', false, 33.9, 676, 247);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (248, 'Wine - Saint - Bris 2002, Sauv', 'Toxicology-blood', false, 30.4, 963, 248);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (249, 'Wine - White, Pinot Grigio', 'Transposit hand tend NEC', true, 27.7, 995, 249);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (250, 'Godiva White Chocolate', 'Therapeutc photopheresis', true, 9.0, 626, 250);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (251, 'Butter - Pod', 'Oth arthrotomy-hip', true, 21.4, 652, 251);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (252, 'Butter Balls Salted', 'Skin closure NEC', true, 45.0, 735, 252);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (253, 'Muffin - Mix - Creme Brule 15l', 'Lacrimal sys dx proc NEC', false, 12.8, 742, 253);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (254, 'Octopus', 'Bact smear-eye', true, 21.1, 858, 254);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (255, 'Sugar - Sweet N Low, Individual', 'Int fix w/o fx reduc NOS', false, 3.3, 730, 255);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (256, 'Sugar - Brown', 'Conjunctival biopsy', false, 34.8, 761, 256);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (257, 'Scallops - U - 10', 'Facial bone x-ray NEC', false, 33.2, 859, 257);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (258, 'Pepper - Chilli Seeds Mild', 'Tot brch extrac w forcep', false, 35.8, 600, 258);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (259, 'Sauce - Alfredo', 'Decortication of lung', false, 48.2, 850, 259);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (260, 'Oil - Sunflower', 'TRAM flap, pedicled', true, 11.3, 959, 260);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (261, 'Creme De Banane - Marie', 'Dx ultrasound-thorax NEC', true, 7.4, 531, 261);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (262, 'Garlic - Peeled', 'Extracorpor hepat Assis', false, 32.6, 565, 262);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (263, 'Chocolate - Sugar Free Semi Choc', 'Complete thyroidectomy', true, 39.0, 518, 263);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (264, 'Sauce - Vodka Blush', 'Replantation of penis', false, 38.3, 600, 264);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (265, 'Pomegranates', 'Whole blood transfus NEC', true, 12.2, 670, 265);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (266, 'Onions - Cippolini', 'Retinal tear laser coag', true, 23.0, 855, 266);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (267, 'Ice Cream - Strawberry', 'Excision of ankle NEC', true, 26.0, 603, 267);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (268, 'Bread Base - Toscano', 'Extended ophthal work-up', false, 29.9, 744, 268);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (269, 'Cake - Lemon Chiffon', 'Metatars/tars inj op NOS', true, 48.7, 534, 269);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (270, 'Wine - Chardonnay South', 'Lap bi indir ing hrn-grf', false, 12.2, 692, 270);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (271, 'Soup - Campbells Broccoli', 'Vaginoscopy', false, 39.8, 679, 271);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (272, 'Tomatoes - Grape', 'Separat unequl join twin', false, 40.0, 741, 272);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (273, 'Cheese - Comte', 'Open reduct maxillary fx', true, 17.2, 862, 273);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (274, 'Peas - Frozen', 'Rev crtd sinus stm leads', false, 29.3, 936, 274);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (275, 'Knife Plastic - White', 'Opn reduc disloc-shouldr', false, 41.1, 947, 275);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (276, 'Bread - Raisin', 'Bone biopsy NEC', true, 22.7, 948, 276);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (277, 'Cheese - Brick With Onion', 'Remov thorax sutures', false, 43.2, 967, 277);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (278, 'Mushroom - Chanterelle, Dry', 'Remov trunk device NEC', true, 45.3, 647, 278);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (279, 'Wine - White, Concha Y Toro', 'Auto hem stem ct w purg', true, 43.1, 559, 279);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (280, 'Energy - Boo - Koo', 'Remove spine theca shunt', false, 27.6, 917, 280);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (281, 'Carbonated Water - Blackcherry', 'Partial ventriculectomy', false, 37.2, 559, 281);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (282, 'Wine - Rosso Toscano Igt', 'Esophageal repair NEC', false, 6.3, 837, 282);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (283, 'Hickory Smoke, Liquid', 'Sphinct of oddi measure', true, 42.3, 878, 283);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (284, 'Muffin Puck Ww Carrot', 'Bact smear-nervous syst', false, 48.3, 810, 284);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (285, 'Wine - Alicanca Vinho Verde', 'Aspiration of bursa', false, 7.0, 983, 285);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (286, 'Bandage - Flexible Neon', 'Intravasclr spectroscopy', true, 6.1, 952, 286);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (287, 'Carrots - Jumbo', 'Limb lengthen proc NOS', true, 29.8, 744, 287);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (288, 'Bread - Bistro White', 'Cerebral thermography', false, 7.9, 873, 288);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (289, 'Pork - Loin, Bone - In', 'Cl red-int fix rad/ulna', true, 38.6, 895, 289);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (290, 'Cheese - Sheep Milk', 'Suppor verbal psychother', false, 8.4, 652, 290);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (291, 'Beets', 'Operation on lens NEC', false, 26.4, 936, 291);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (292, 'Pastry - Mini French Pastries', 'Consultation NEC', false, 38.8, 949, 292);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (293, 'Crab - Dungeness, Whole', 'Renal scan/isotope funct', false, 48.5, 820, 293);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (294, 'Lamb - Shanks', 'Urethrotomy', true, 7.0, 924, 294);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (295, 'Goulash Seasoning', 'Nasophary contrast x-ray', true, 38.5, 531, 295);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (296, 'Plasticspoonblack', 'Lap umbilical hernia NEC', true, 18.3, 512, 296);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (297, 'Tomatoes - Diced, Canned', 'Intranasal antrotomy', false, 37.9, 517, 297);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (298, 'Chicken - White Meat With Tender', 'Other group therapy', false, 22.2, 786, 298);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (299, 'Juice - Prune', 'Tot brch extrac w forcep', false, 48.9, 956, 299);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (300, 'Plate Pie Foil', 'Remov intralum esoph FB', true, 25.8, 867, 300);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (301, 'Chicken - Base', 'Contrast vasogram', true, 44.8, 513, 301);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (302, 'Ranchero - Primerba, Paste', 'Imp cardiomyostimul sys', true, 5.3, 646, 302);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (303, 'Dc Hikiage Hira Huba', 'Part sm bowel resect NEC', false, 42.9, 537, 303);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (304, 'Mushroom - Shitake, Fresh', 'Dressing of wound NEC', true, 14.1, 540, 304);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (305, 'Pork - Suckling Pig', 'Mobilization of spine', false, 15.6, 863, 305);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (306, 'Bread Cranberry Foccacia', 'Drsl/drslumb fus ant/ant', true, 11.8, 573, 306);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (307, 'Thyme - Fresh', 'Vulvar adhesiolysis', true, 1.7, 545, 307);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (308, 'Bread - Dark Rye', 'Repl pacem w dual-cham', false, 38.0, 583, 308);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (309, 'Propel Sport Drink', 'Replace wound pack/drain', true, 19.0, 518, 309);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (310, 'Nut - Chestnuts, Whole', 'Urethral biopsy', true, 12.8, 561, 310);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (311, 'Salmon - Canned', 'Skel xray-elbow/forearm', true, 18.9, 630, 311);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (312, 'Versatainer Nc - 9388', 'Destruct joint les NOS', true, 12.3, 841, 312);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (313, 'Sprouts - Bean', 'Crown application', false, 22.4, 968, 313);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (314, 'Wine - Two Oceans Cabernet', 'Iris operation NEC', true, 4.7, 684, 314);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (315, 'Nut - Almond, Blanched, Whole', 'Auto hem stem ct w purg', false, 8.9, 759, 315);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (316, 'Stock - Chicken, White', 'Prosth rep hrt septa NOS', true, 7.2, 547, 316);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (317, 'Sauce - Hp', 'Suture vagina laceration', true, 37.8, 953, 317);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (318, 'Nut - Peanut, Roasted', 'Ather oth non-cor vessel', true, 6.6, 952, 318);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (319, 'Lemonade - Pineapple Passion', 'Totl reconstc breast NOS', false, 37.6, 572, 319);
insert into producto (id_product, name_product, desc_product, dangerous, kg, cant, id_transport) values (320, 'Bread - Onion Focaccia', 'Metacarpal/carpal biopsy', false, 33.9, 856, 320);

/* empresa_destino */
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (1, 'Homenick, Harris and Feeney', '0618982191', '2020-09-05', '718 Schurz Junction', 1);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (2, 'Maggio and Sons', '5636398174', '2019-11-18', '96 Heath Trail', 2);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (3, 'Schaefer, O''Hara and Pouros', '5743402205', '2020-11-20', '4945 2nd Way', 3);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (4, 'Green Group', '1099109299', '2021-05-30', '187 Hagan Hill', 4);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (5, 'Schmidt, Fritsch and Bahringer', '9719919175', '2018-04-24', '90707 Welch Junction', 5);

insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (6, 'Bartoletti, Sporer and Gibson', '9787948762', '2018-06-29', '27628 Raven Place', 6);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (7, 'Connelly-Dibbert', '5578366104', '2017-04-13', '65 Northview Street', 7);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (8, 'Schmidt, Wiegand and Feeney', '0579442381', '2020-02-03', '744 Claremont Way', 8);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (9, 'Price Inc', '7183364461', '2021-03-12', '16504 Armistice Way', 9);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (10, 'Legros-Wiegand', '4814516819', '2020-10-16', '0 Bunker Hill Pass', 10);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (11, 'Grimes Inc', '1310443416', '2017-07-17', '1 Center Drive', 11);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (12, 'Johns, Franecki and Hammes', '3278199839', '2022-05-19', '1 Redwing Terrace', 12);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (13, 'Littel LLC', '7315813845', '2023-07-08', '52722 Amoth Alley', 13);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (14, 'Purdy Group', '9553440460', '2020-09-17', '709 Golf View Plaza', 14);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (15, 'Klocko LLC', '5705766874', '2019-11-02', '044 Southridge Alley', 15);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (16, 'Kub-Monahan', '1858575842', '2018-04-03', '0 Grasskamp Lane', 16);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (17, 'Mann-Wiza', '3023820546', '2019-04-26', '072 Portage Road', 17);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (18, 'Ziemann, Bogan and Mills', '5181590713', '2023-04-15', '7 Everett Street', 18);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (19, 'Ankunding and Sons', '2645897657', '2019-03-13', '222 Granby Way', 19);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (20, 'Mitchell Group', '1389614581', '2019-10-27', '5874 Mockingbird Crossing', 20);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (21, 'McCullough, Johnston and Macejkovic', '1295881373', '2023-03-15', '787 Sunnyside Trail', 21);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (22, 'Schimmel-Ritchie', '3651893901', '2022-06-24', '678 Londonderry Crossing', 22);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (23, 'Morar Group', '8811486777', '2018-09-24', '6 Luster Center', 23);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (24, 'Donnelly, Walker and Marvin', '9593253459', '2020-10-29', '74 Rowland Center', 24);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (25, 'Osinski-Feil', '6829458005', '2018-05-31', '416 2nd Avenue', 25);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (26, 'Gleason, Ziemann and Olson', '6469367518', '2022-12-26', '13250 Park Meadow Park', 26);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (27, 'Swaniawski, Larkin and Skiles', '4383333974', '2020-05-09', '5287 Morrow Road', 27);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (28, 'Carroll-Cruickshank', '1467937479', '2019-02-07', '0986 North Pass', 28);

insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (29, 'Johnson Inc', '3507215209', '2023-07-16', '83 Talmadge Trail', 29);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (30, 'Kautzer and Sons', '3136891767', '2018-06-02', '69 Gale Avenue', 30);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (31, 'Heaney, Ortiz and Hirthe', '9227162933', '2022-06-07', '03 Moulton Circle', 31);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (32, 'Ebert, Collins and Kshlerin', '2072635616', '2020-01-26', '84862 Doe Crossing Plaza', 32);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (33, 'Bins-Stamm', '3783778301', '2021-04-02', '667 Springview Parkway', 33);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (34, 'Hilpert and Sons', '6140326613', '2020-06-21', '77670 Fieldstone Place', 34);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (35, 'Price-Ledner', '8957923233', '2018-06-07', '93883 Norway Maple Drive', 35);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (36, 'Metz and Sons', '0999851950', '2017-09-13', '9640 Pawling Junction', 36);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (37, 'Tremblay, Marvin and Gutmann', '3107635650', '2023-04-15', '4228 Independence Street', 37);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (38, 'Ruecker, Bergstrom and Walker', '3724740999', '2021-06-28', '02753 Tennyson Hill', 38);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (39, 'Konopelski-Donnelly', '5568023387', '2023-08-06', '281 Vidon Trail', 39);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (40, 'Boyle-Gislason', '8513990582', '2022-11-02', '247 Susan Park', 40);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (41, 'Mohr-Auer', '8041452698', '2019-09-17', '6215 Roxbury Point', 41);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (42, 'Von Inc', '5503593251', '2017-12-05', '02887 Tomscot Trail', 42);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (43, 'O''Reilly-Thiel', '2599594219', '2022-01-01', '48251 Michigan Court', 43);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (44, 'Fahey-Bauch', '7825457781', '2018-09-23', '7812 Gulseth Alley', 44);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (45, 'Kohler, Strosin and Jast', '6350008782', '2019-06-14', '380 Bashford Drive', 45);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (46, 'Kutch LLC', '8782033528', '2023-06-21', '9516 Lakewood Street', 46);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (47, 'Vandervort, Wunsch and Brown', '9761736946', '2022-05-16', '29 Welch Trail', 47);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (48, 'Conn Inc', '5959188589', '2023-01-09', '44 Sachs Alley', 48);

insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (49, 'Grant, Jast and Will', '2962362478', '2017-02-06', '70 Fair Oaks Parkway', 49);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (50, 'Koch, Littel and Ankunding', '7882368180', '2017-08-10', '392 Bobwhite Circle', 50);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (51, 'Deckow, Jerde and Schmitt', '6111633732', '2018-05-20', '0948 Lyons Hill', 51);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (52, 'Dickens Group', '5826128119', '2018-10-18', '12 Mockingbird Road', 52);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (53, 'Nicolas-Zieme', '3018514327', '2017-03-04', '986 Springs Point', 53);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (54, 'Conn-Keebler', '4938332701', '2019-07-11', '74 Thierer Park', 54);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (55, 'Hirthe and Sons', '7930116018', '2022-04-16', '3 Ramsey Court', 55);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (56, 'Becker-Borer', '3830998945', '2019-09-25', '4 Nelson Road', 56);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (57, 'Rodriguez LLC', '9643759083', '2020-05-08', '2023 Sullivan Trail', 57);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (58, 'Stracke-Dibbert', '1954975317', '2018-01-02', '80 Boyd Point', 58);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (59, 'Corkery Group', '2185882848', '2018-10-24', '763 Oxford Street', 59);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (60, 'Frami-Deckow', '8294941107', '2017-03-08', '3 Maple Center', 60);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (61, 'Kilback and Sons', '7211622261', '2021-02-14', '65 Glendale Terrace', 61);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (62, 'Bernhard Group', '1632394057', '2017-11-20', '33 Southridge Pass', 62);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (63, 'Mann and Sons', '8217206104', '2019-01-30', '32478 Sachs Crossing', 63);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (64, 'Quigley, Rippin and Bergstrom', '4271963038', '2017-08-06', '983 Mockingbird Avenue', 64);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (65, 'Simonis, Bartoletti and Steuber', '2280134659', '2023-07-28', '5 Bowman Terrace', 65);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (66, 'Williamson Inc', '5738574958', '2020-09-12', '90 Barnett Hill', 66);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (67, 'Wolff, Miller and Jones', '7999931098', '2021-01-13', '801 Anderson Court', 67);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (68, 'Bergnaum-Lind', '0823131831', '2022-06-15', '128 Daystar Park', 68);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (69, 'Beier-Cronin', '5987252059', '2018-07-17', '810 Butterfield Pass', 69);

insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (70, 'Botsford-Denesik', '9674367896', '2021-05-04', '25 Elgar Parkway', 70);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (71, 'Padberg-Heathcote', '6724825423', '2022-03-11', '15444 Pennsylvania Court', 71);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (72, 'Kerluke-McKenzie', '9312100920', '2022-04-08', '43624 Valley Edge Circle', 72);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (73, 'Weber, Ratke and Gleichner', '2497351333', '2019-01-23', '6 Oak Valley Junction', 73);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (74, 'Wisoky and Sons', '1295277514', '2018-05-29', '5168 Cherokee Plaza', 74);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (75, 'Leffler-Harris', '8587040634', '2020-03-20', '95 Karstens Circle', 75);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (76, 'Osinski Inc', '8399547417', '2022-08-28', '6534 Norway Maple Trail', 76);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (77, 'Jones-Kihn', '8739496007', '2019-11-07', '46 Westend Junction', 77);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (78, 'Padberg, Stiedemann and Heaney', '7549653518', '2020-12-12', '798 Washington Hill', 78);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (79, 'Dooley, Cummerata and Aufderhar', '7497822144', '2020-03-06', '0334 Claremont Avenue', 79);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (80, 'Cronin-Leuschke', '7396771897', '2023-07-29', '8115 Larry Alley', 80);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (81, 'Wolf, Weber and Reinger', '5831367509', '2017-03-21', '478 Kingsford Drive', 81);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (82, 'Erdman, Bins and Jacobson', '4430364702', '2022-10-28', '3 Leroy Circle', 82);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (83, 'Legros, Goodwin and Konopelski', '1975888324', '2022-11-26', '237 Amoth Plaza', 83);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (84, 'Bernier LLC', '6870530688', '2020-05-27', '39 Arapahoe Junction', 84);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (85, 'Deckow, Crona and Pfeffer', '4032234493', '2019-08-25', '50486 Transport Crossing', 85);

insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (86, 'Cole-Gorczany', '3173944054', '2020-12-11', '74 Melrose Trail', 86);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (87, 'Miller-Schroeder', '9866222616', '2020-07-14', '20 Brentwood Parkway', 87);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (88, 'Kunde and Sons', '1131397479', '2019-08-02', '25750 Oxford Plaza', 88);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (89, 'Wisoky LLC', '8358793642', '2022-06-01', '629 Maple Street', 89);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (90, 'Schimmel-Lockman', '3355900974', '2019-06-30', '3193 Blaine Drive', 90);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (91, 'Ziemann-Glover', '8991843433', '2017-10-15', '75408 Fairfield Way', 91);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (92, 'Willms Inc', '1236432444', '2023-03-01', '94073 Upham Road', 92);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (93, 'Lockman-Williamson', '9700219569', '2018-10-23', '5777 Mockingbird Avenue', 93);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (94, 'Rogahn, Walsh and Hamill', '1527151948', '2017-07-22', '1 Lakewood Gardens Point', 94);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (95, 'Torphy Inc', '2750781159', '2018-01-07', '90624 Kingsford Place', 95);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (96, 'Schowalter Inc', '0275567370', '2017-10-09', '0865 Harbort Crossing', 96);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (97, 'Jaskolski, Nicolas and Dooley', '2894385374', '2023-05-06', '2 Parkside Crossing', 97);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (98, 'Wilkinson-Graham', '8958141174', '2020-09-18', '7 Meadow Vale Alley', 98);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (99, 'Greenfelder, Schimmel and Heaney', '3782752309', '2022-08-18', '474 Moland Court', 99);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (100, 'Boehm LLC', '2111132322', '2020-05-24', '18597 Talisman Junction', 100);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (101, 'Hegmann and Sons', '8118993272', '2023-07-07', '0108 Dryden Pass', 101);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (102, 'Hansen, McCullough and Hansen', '3179170565', '2021-05-18', '1 Dakota Plaza', 102);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (103, 'Kihn, Roob and Runte', '3329103736', '2019-07-27', '20352 Elgar Terrace', 103);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (104, 'Legros-Dare', '1092843043', '2019-01-28', '39636 Carpenter Court', 104);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (105, 'Daniel and Sons', '0495333239', '2019-05-12', '314 Esch Hill', 105);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (106, 'Jakubowski and Sons', '3606386869', '2020-04-20', '69622 Warrior Hill', 106);

insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (107, 'Corwin, Medhurst and Rolfson', '3945457386', '2022-11-14', '5562 Kings Park', 107);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (108, 'Pagac and Sons', '3334717569', '2018-04-17', '71433 Erie Plaza', 108);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (109, 'Howell LLC', '9956230359', '2023-05-15', '020 Onsgard Trail', 109);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (110, 'Emmerich-Kuhn', '1326530496', '2019-08-17', '01 Scofield Center', 110);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (111, 'Haley-Feest', '5075575293', '2019-04-06', '636 Jackson Street', 111);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (112, 'MacGyver-Krajcik', '0105017396', '2020-01-21', '5119 Meadow Valley Center', 112);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (113, 'Borer, O''Reilly and Grant', '6762415474', '2019-04-13', '7104 Trailsway Plaza', 113);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (114, 'Fadel-Crooks', '5812508569', '2023-03-07', '34110 Almo Hill', 114);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (115, 'Moen, Baumbach and Zboncak', '9252461914', '2018-10-09', '5731 Bunker Hill Point', 115);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (116, 'Upton, Hand and Kovacek', '8752549607', '2020-10-29', '5306 Browning Alley', 116);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (117, 'Yundt-Schmeler', '6209844804', '2023-01-20', '42 Everett Parkway', 117);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (118, 'Smitham LLC', '3971561853', '2022-03-27', '048 Mandrake Alley', 118);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (119, 'Klocko, McClure and Bode', '5209200736', '2021-11-19', '17604 Dakota Court', 119);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (120, 'VonRueden, Legros and Lubowitz', '0328874795', '2020-02-08', '19 Jackson Alley', 120);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (121, 'Emmerich-Schaden', '6355340017', '2023-06-27', '01 Kensington Lane', 121);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (122, 'Ziemann-Swift', '1225395054', '2020-06-23', '93067 Michigan Circle', 122);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (123, 'Witting-Pollich', '0364033363', '2017-07-27', '4 Carioca Drive', 123);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (124, 'Marvin, Collier and Price', '1623345170', '2023-06-24', '882 Fulton Court', 124);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (125, 'Bartell LLC', '0537421416', '2021-01-05', '6 Southridge Park', 125);

insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (126, 'Tromp-Spinka', '5970181986', '2022-03-15', '36 Iowa Alley', 126);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (127, 'Dickens-Langworth', '5359932058', '2017-04-17', '7 Mockingbird Court', 127);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (128, 'Murray, Shanahan and Mayert', '2650097779', '2021-05-03', '207 Northfield Crossing', 128);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (129, 'Gerhold LLC', '0799229504', '2017-08-05', '4 Mendota Hill', 129);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (130, 'Mitchell, Friesen and Rolfson', '9298915101', '2021-07-19', '3 Roth Court', 130);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (131, 'Purdy, Mitchell and Bahringer', '6938013152', '2020-06-25', '88 Mcbride Place', 131);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (132, 'Runolfsson-Roberts', '9191026245', '2018-01-16', '7 Sullivan Center', 132);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (133, 'Reinger Group', '6070474759', '2017-09-30', '2694 Thierer Center', 133);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (134, 'Waters-Miller', '8160177569', '2022-10-22', '54 Dorton Junction', 134);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (135, 'O''Conner, Champlin and Cassin', '6858739025', '2020-04-25', '4329 Northridge Court', 135);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (136, 'Huel Group', '3022578032', '2017-02-11', '339 Hudson Drive', 136);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (137, 'Dietrich, Greenfelder and Sauer', '4085558331', '2020-04-02', '3310 2nd Place', 137);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (138, 'Volkman-Wisozk', '3814720113', '2021-12-09', '6953 Springs Parkway', 138);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (139, 'Howe and Sons', '9243486748', '2018-04-01', '1641 Forest Dale Way', 139);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (140, 'Wehner-Kautzer', '2963684916', '2019-07-16', '386 Mesta Parkway', 140);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (141, 'Jacobi-Stamm', '3571509145', '2017-02-02', '82 Mayer Lane', 141);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (142, 'Bogan, Rohan and Howe', '3109135086', '2020-02-11', '15 7th Junction', 142);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (143, 'Prohaska-Effertz', '5549862018', '2021-07-22', '278 Twin Pines Pass', 143);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (144, 'Lind Inc', '0101980582', '2017-05-10', '97 Warrior Hill', 144);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (145, 'Johnson-Labadie', '2336236109', '2017-08-06', '0 Ramsey Place', 145);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (146, 'Schmitt, Corwin and Bosco', '1076702481', '2023-05-05', '31 Blaine Terrace', 146);

insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (147, 'Hilll, O''Connell and Pollich', '9166206502', '2022-09-10', '798 Anthes Court', 147);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (148, 'Kozey, Ruecker and Dare', '1642220817', '2022-10-31', '0163 International Road', 148);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (149, 'Lakin, Wyman and Goldner', '1784404837', '2022-04-17', '71 Algoma Terrace', 149);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (150, 'Bahringer Inc', '9936910001', '2019-11-06', '540 Golf View Place', 150);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (151, 'Padberg-Runolfsson', '8230690812', '2022-09-20', '91 Schlimgen Court', 151);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (152, 'Powlowski-Stoltenberg', '0114770514', '2017-07-19', '7556 Sloan Trail', 152);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (153, 'Gutmann and Sons', '0473882906', '2020-02-27', '181 Maywood Crossing', 153);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (154, 'Bednar-D''Amore', '0697939308', '2022-06-28', '08959 Eliot Place', 154);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (155, 'Greenholt and Sons', '8766380294', '2019-02-21', '38825 Heffernan Alley', 155);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (156, 'O''Hara LLC', '0093238525', '2017-11-10', '45 Heath Place', 156);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (157, 'Hagenes, Koss and Gislason', '2350467120', '2020-11-23', '4 Sunfield Terrace', 157);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (158, 'Davis and Sons', '0415205433', '2018-04-30', '452 Golden Leaf Plaza', 158);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (159, 'Hoppe-O''Conner', '4336481415', '2017-12-03', '7 Kim Junction', 159);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (160, 'Schmidt, Becker and Schulist', '6481696232', '2022-07-02', '40 Prentice Crossing', 160);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (161, 'Hayes LLC', '1104872420', '2021-06-06', '4388 New Castle Junction', 161);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (162, 'Homenick-Yost', '0464396794', '2022-06-26', '9 Saint Paul Road', 162);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (163, 'Kohler, Hammes and Willms', '3771814189', '2023-02-27', '84 Memorial Pass', 163);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (164, 'Erdman Inc', '3741118974', '2020-05-15', '258 Kinsman Plaza', 164);

insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (165, 'Mosciski, Ritchie and Kihn', '9654228017', '2020-06-29', '90 Badeau Point', 165);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (166, 'Gerhold-Goodwin', '4368947797', '2023-06-23', '5 Thompson Pass', 166);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (167, 'Wyman, Kuhic and Effertz', '4425668278', '2017-10-16', '6617 Memorial Court', 167);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (168, 'Reilly, Conroy and Spinka', '5690952796', '2019-07-09', '233 Lakewood Junction', 168);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (169, 'Weissnat, Lakin and Skiles', '5700817500', '2023-02-23', '51991 Doe Crossing Plaza', 169);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (170, 'Wyman, Upton and Kling', '8983301228', '2018-06-16', '9230 Ohio Court', 170);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (171, 'Feest, Purdy and Lang', '4807977652', '2023-06-03', '82531 Spaight Junction', 171);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (172, 'Abbott, Erdman and Bogisich', '2342915624', '2023-04-28', '220 Atwood Place', 172);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (173, 'Murray, Funk and Yost', '8800927653', '2020-06-16', '17 Lighthouse Bay Street', 173);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (174, 'Gerlach-Mayer', '9956075167', '2023-02-01', '0957 Kedzie Lane', 174);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (175, 'Herzog-Price', '5798983463', '2018-09-06', '26641 Redwing Park', 175);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (176, 'Bednar, Ratke and Gerhold', '9447206166', '2023-01-09', '408 Brickson Park Court', 176);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (177, 'Beier, Kihn and Shields', '0956683770', '2018-12-23', '383 Pierstorff Place', 177);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (178, 'Howe-Reilly', '8204381352', '2022-02-07', '11186 Bay Plaza', 178);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (179, 'Parisian Inc', '1358396884', '2017-06-14', '77 David Point', 179);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (180, 'Hilll Inc', '1468062573', '2019-09-02', '5 Heath Court', 180);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (181, 'Kessler, Collier and Braun', '1809126878', '2019-06-11', '74 Vera Way', 181);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (182, 'Stanton, Bernier and Thiel', '8198436804', '2022-10-11', '2084 Nelson Court', 182);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (183, 'Harber, Dickinson and Smitham', '5313306898', '2022-01-15', '0 Loomis Parkway', 183);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (184, 'Nikolaus Group', '0706540611', '2018-02-06', '406 Village Street', 184);

insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (185, 'Shields, Ernser and Wintheiser', '9028696881', '2019-02-10', '6 Judy Center', 185);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (186, 'Denesik-Langosh', '5582961895', '2018-06-06', '5 Dakota Park', 186);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (187, 'Hane, Rath and Cremin', '8110164536', '2018-10-14', '6134 Blaine Trail', 187);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (188, 'Murazik Inc', '9660676174', '2019-06-22', '8 Jackson Lane', 188);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (189, 'Nikolaus, Ledner and Kirlin', '3751309691', '2019-05-02', '23 Manitowish Road', 189);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (190, 'Legros-Harris', '1538451441', '2019-01-16', '7270 Spohn Drive', 190);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (191, 'Bechtelar Inc', '7696890611', '2023-02-18', '81723 Butterfield Court', 191);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (192, 'Stroman-Yundt', '5443519360', '2023-05-16', '35 Marquette Street', 192);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (193, 'Bogan-Brakus', '3485691984', '2022-09-14', '28065 Granby Park', 193);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (194, 'Rosenbaum-Grimes', '1543244548', '2019-08-06', '08442 Colorado Way', 194);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (195, 'Kutch-Mayert', '4453146752', '2021-08-29', '8 Miller Junction', 195);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (196, 'Harris, Predovic and Sipes', '9862441259', '2017-08-28', '2 Bartillon Circle', 196);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (197, 'Thiel Group', '5121404700', '2017-04-23', '5 Tennessee Plaza', 197);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (198, 'Bode Inc', '3186700663', '2018-07-14', '96575 Ilene Crossing', 198);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (199, 'Gerlach, Purdy and Friesen', '9042345373', '2021-01-03', '9 Derek Parkway', 199);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (200, 'Pfannerstill LLC', '3450011340', '2020-03-19', '1492 Pine View Hill', 200);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (201, 'Roob and Sons', '6033524721', '2022-03-11', '0349 Alpine Alley', 201);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (202, 'Flatley-Tromp', '2937345794', '2017-09-29', '96 Ridgeway Alley', 202);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (203, 'Schinner-McKenzie', '6635566678', '2019-01-16', '6904 Burrows Place', 203);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (204, 'Rau Group', '4390968351', '2018-02-22', '9683 Waywood Plaza', 204);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (205, 'Stehr, Muller and Kerluke', '0810063026', '2021-02-13', '0 Buell Lane', 205);

insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (206, 'Howe and Sons', '3969931363', '2022-10-15', '58 Debra Pass', 206);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (207, 'Hettinger, Tremblay and Prosacco', '0358182646', '2017-04-10', '07689 Lien Circle', 207);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (208, 'Gleichner and Sons', '6007181812', '2021-01-12', '26376 Jackson Alley', 208);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (209, 'Rohan Inc', '4576545736', '2019-12-03', '0020 Reindahl Road', 209);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (210, 'Crona-Hilll', '8617796391', '2020-11-10', '868 Columbus Street', 210);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (211, 'Klocko-Bartell', '4645808427', '2020-07-21', '725 Emmet Court', 211);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (212, 'Deckow, D''Amore and Homenick', '8326503614', '2021-02-17', '0791 Mcguire Circle', 212);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (213, 'Hudson, Stiedemann and Friesen', '7475601625', '2018-01-30', '56 Lyons Place', 213);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (214, 'Conn, Spencer and Von', '9813498943', '2023-04-15', '8585 Service Plaza', 214);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (215, 'Kautzer Group', '0770351220', '2021-11-17', '88 Hoffman Center', 215);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (216, 'Bednar, Schneider and Moen', '2469242576', '2019-10-10', '25 Merrick Avenue', 216);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (217, 'Terry and Sons', '3534440404', '2021-11-20', '1766 Merry Street', 217);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (218, 'McGlynn-Schumm', '7808898074', '2023-06-22', '04 Rusk Drive', 218);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (219, 'Jenkins LLC', '0658311069', '2017-03-27', '69264 Cardinal Place', 219);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (220, 'Jacobs-Kertzmann', '1320018793', '2018-08-12', '9180 Derek Place', 220);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (221, 'Mohr Group', '7028215687', '2017-08-28', '9 Spenser Place', 221);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (222, 'Bartell-Wilderman', '0459978640', '2017-09-06', '2480 Granby Lane', 222);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (223, 'Luettgen Inc', '4225491315', '2017-02-11', '4220 Redwing Place', 223);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (224, 'Crooks-Crist', '8938958116', '2019-11-23', '711 Ruskin Hill', 224);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (225, 'Grimes, Hermann and Kihn', '4980367313', '2019-10-03', '66484 Algoma Alley', 225);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (226, 'Hessel-Kub', '4165859915', '2023-05-07', '862 Gulseth Crossing', 226);

insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (227, 'Veum-Leffler', '3775609644', '2017-11-12', '43260 Merchant Road', 227);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (228, 'Greenfelder-Jaskolski', '5962836537', '2022-11-12', '279 Monterey Hill', 228);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (229, 'Carroll LLC', '0166935565', '2021-06-05', '8876 Columbus Place', 229);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (230, 'Hamill-Reynolds', '4810040666', '2020-10-12', '2 Lawn Trail', 230);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (231, 'Swaniawski LLC', '1450917143', '2023-02-23', '5 Valley Edge Pass', 231);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (232, 'Spinka-Zieme', '9299802076', '2021-03-17', '05 Arizona Terrace', 232);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (233, 'Greenholt, Bruen and Ryan', '5975120578', '2020-12-02', '33182 Gale Place', 233);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (234, 'Ullrich-Auer', '8876845887', '2020-10-03', '13 Cascade Alley', 234);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (235, 'Schiller, Spencer and Lemke', '3083055781', '2022-04-08', '08 Nevada Park', 235);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (236, 'Wiegand and Sons', '1725419424', '2021-12-31', '7230 Walton Plaza', 236);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (237, 'Dickinson Group', '7218829619', '2018-12-15', '2 Debs Road', 237);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (238, 'Stokes-Haley', '1356814646', '2017-02-26', '1 Melody Terrace', 238);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (239, 'Kuhlman-Bartell', '0661754472', '2019-02-15', '3117 High Crossing Plaza', 239);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (240, 'Cassin LLC', '2159921882', '2022-04-10', '80054 Parkside Circle', 240);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (241, 'Quigley, Baumbach and Braun', '0154727806', '2021-08-26', '45032 3rd Way', 241);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (242, 'Bauch-Bailey', '1342074289', '2021-01-11', '0876 Linden Street', 242);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (243, 'Koss-Lind', '1466711914', '2019-08-04', '645 Starling Point', 243);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (244, 'Jast-Koelpin', '3212636971', '2023-03-21', '2894 Boyd Junction', 244);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (245, 'Hauck LLC', '7105336056', '2018-07-11', '49 Twin Pines Avenue', 245);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (246, 'McCullough Inc', '1045028428', '2021-08-30', '01 Melrose Lane', 246);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (247, 'Franecki, Heathcote and Durgan', '3158814668', '2019-07-16', '98 Lakewood Gardens Way', 247);

insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (248, 'Schulist, Senger and Romaguera', '1850922160', '2017-04-15', '0 Steensland Junction', 248);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (249, 'Turcotte-Fahey', '0819829374', '2017-07-04', '97665 Hazelcrest Court', 249);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (250, 'Wyman, Koelpin and Kshlerin', '4021690808', '2019-02-21', '63 Maryland Circle', 250);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (251, 'Goodwin-Will', '9606248534', '2019-02-05', '3240 Portage Trail', 251);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (252, 'Schoen-Yundt', '2204606227', '2022-02-17', '1 Manley Circle', 252);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (253, 'Daniel, Hartmann and Adams', '5008854208', '2019-09-30', '61 School Junction', 253);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (254, 'Bernhard-Bailey', '8800579442', '2021-05-11', '7 Ramsey Plaza', 254);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (255, 'Morissette Group', '7553932779', '2017-04-09', '3129 Spenser Court', 255);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (256, 'Pfannerstill, McLaughlin and Waters', '3564802568', '2021-07-21', '8362 Maryland Center', 256);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (257, 'Ferry-O''Connell', '2582034649', '2020-03-09', '22967 Fuller Street', 257);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (258, 'Kub, Yundt and Rau', '8801934297', '2018-07-27', '95528 Derek Drive', 258);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (259, 'Larkin-Heller', '1918108870', '2018-01-08', '17 Dunning Junction', 259);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (260, 'Wehner, Reinger and Wintheiser', '5435956323', '2020-09-04', '140 Carey Drive', 260);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (261, 'Streich LLC', '7644797041', '2022-08-23', '2028 Hazelcrest Way', 261);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (262, 'Schuppe, Kautzer and Rolfson', '6823201150', '2017-06-21', '83 Alpine Parkway', 262);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (263, 'Von, Volkman and Barton', '7257965587', '2023-02-14', '39057 Myrtle Place', 263);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (264, 'Sipes LLC', '0350740305', '2020-01-17', '334 International Point', 264);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (265, 'Mayer-Douglas', '1629560928', '2022-07-15', '3986 Sutteridge Plaza', 265);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (266, 'Mohr-Harris', '1845230175', '2022-10-25', '39 Hooker Junction', 266);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (267, 'Heathcote, Schowalter and Wintheiser', '9356893578', '2020-08-01', '22 Main Circle', 267);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (268, 'Brekke-Robel', '7059127690', '2019-02-12', '16076 Linden Way', 268);

insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (269, 'Wolff, Murphy and Rosenbaum', '1482309858', '2021-06-07', '400 Westridge Road', 269);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (270, 'Wilkinson-Nitzsche', '9531031231', '2022-10-22', '704 Ridgeview Hill', 270);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (271, 'Auer, Leffler and Waters', '9457490843', '2023-08-09', '5731 Marquette Crossing', 271);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (272, 'Heathcote and Sons', '6556988863', '2022-06-03', '8460 Banding Drive', 272);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (273, 'Wuckert and Sons', '3478068339', '2021-11-29', '870 Maryland Junction', 273);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (274, 'Grimes LLC', '0338532145', '2023-07-04', '50144 Ruskin Crossing', 274);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (275, 'Pollich Group', '8715510506', '2023-01-18', '2370 1st Plaza', 275);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (276, 'Lemke Inc', '2604216027', '2020-03-26', '186 Red Cloud Center', 276);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (277, 'Ondricka-Ruecker', '6129007647', '2018-08-25', '2133 Thackeray Point', 277);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (278, 'Klocko, Hills and Corkery', '3083097247', '2021-03-09', '973 Katie Street', 278);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (279, 'Nader and Sons', '0394495071', '2020-07-14', '819 Prentice Pass', 279);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (280, 'Pfannerstill-O''Reilly', '9847854025', '2019-01-19', '50 Blackbird Way', 280);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (281, 'Cruickshank-Turcotte', '0134990730', '2021-05-27', '4480 New Castle Road', 281);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (282, 'Harber-Grimes', '9119830831', '2018-03-12', '0906 Jenna Terrace', 282);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (283, 'Powlowski, Friesen and Robel', '5983170007', '2019-02-05', '1645 Pleasure Circle', 283);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (284, 'Feest, Auer and Stanton', '5394099057', '2023-05-04', '6 Mariners Cove Plaza', 284);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (285, 'Kub-McClure', '1105506177', '2018-06-27', '9405 Valley Edge Trail', 285);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (286, 'Hauck-McClure', '8830537764', '2018-06-06', '2 Blaine Drive', 286);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (287, 'Ward, Ratke and Marks', '5633702646', '2017-03-29', '000 Myrtle Pass', 287);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (288, 'Robel Group', '4343358356', '2017-09-05', '33 Gale Way', 288);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (289, 'Padberg-Schmidt', '6016769312', '2021-01-25', '697 Barby Drive', 289);

insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (290, 'Schimmel and Sons', '8833586480', '2020-09-06', '5775 Vernon Plaza', 290);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (291, 'Franecki-Batz', '7168741802', '2018-06-05', '29048 Veith Point', 291);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (292, 'Roob-Abernathy', '0455902585', '2018-03-19', '7559 Acker Road', 292);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (293, 'Donnelly, Ruecker and Langosh', '1118149920', '2018-06-22', '876 5th Parkway', 293);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (294, 'Keebler-Feest', '2311695002', '2019-11-27', '6 Burrows Park', 294);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (295, 'Cruickshank, Stoltenberg and Kertzmann', '6498714654', '2017-05-18', '40180 Tony Trail', 295);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (296, 'Cremin, Jenkins and Bayer', '4398578684', '2017-10-10', '84273 Fair Oaks Court', 296);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (297, 'Lowe LLC', '3808302577', '2019-03-25', '55 Shopko Park', 297);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (298, 'Moore-Kulas', '3630204058', '2021-11-27', '89 Doe Crossing Pass', 298);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (299, 'Oberbrunner, Abshire and Connelly', '2124527916', '2018-05-18', '96477 Quincy Trail', 299);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (300, 'Kunde Inc', '3262017833', '2018-09-23', '7 Corscot Place', 300);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (301, 'Tillman-Morar', '6954805459', '2021-04-24', '586 Corben Center', 301);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (302, 'Douglas Inc', '8413084997', '2019-03-09', '67234 Loomis Trail', 302);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (303, 'Langworth, Daniel and Simonis', '2890279855', '2023-03-24', '4233 Fisk Point', 303);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (304, 'McCullough, Lakin and Zulauf', '3245193998', '2020-03-10', '8 Toban Pass', 304);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (305, 'Howell and Sons', '3902589450', '2020-01-26', '1930 Chinook Court', 305);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (306, 'Oberbrunner, Rowe and Jerde', '0256191476', '2017-02-12', '970 Corscot Place', 306);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (307, 'Rosenbaum, McGlynn and Pouros', '8730734169', '2020-03-13', '65086 Forest Court', 307);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (308, 'McLaughlin, Ankunding and Flatley', '6075445951', '2019-07-22', '7 Claremont Place', 308);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (309, 'Crist, Parker and Wintheiser', '8765139917', '2017-04-23', '37 Hansons Drive', 309);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (310, 'Barton LLC', '4097901516', '2022-09-29', '387 Waubesa Plaza', 310);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (311, 'Harvey Group', '7133111306', '2020-10-24', '33717 Anzinger Hill', 311);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (312, 'Wisozk-Herzog', '3323583302', '2022-05-30', '73261 Carioca Junction', 312);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (313, 'Hilll Inc', '2078541338', '2017-09-21', '5 Center Crossing', 313);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (314, 'Grant LLC', '7704525662', '2018-11-26', '3 Monterey Parkway', 314);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (315, 'Prosacco-Medhurst', '5160256431', '2023-01-13', '28064 Crowley Place', 315);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (316, 'Medhurst-Nolan', '5028291012', '2018-04-29', '25373 Bultman Point', 316);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (317, 'O''Connell Group', '6658650314', '2020-01-23', '1 Little Fleur Road', 317);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (318, 'Little, Harris and Monahan', '6120806490', '2017-10-28', '7236 Farmco Road', 318);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (319, 'Olson-Christiansen', '9575388208', '2019-11-06', '4 Mccormick Court', 319);
insert into empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) values (320, 'Denesik and Sons', '9707300736', '2019-04-19', '8263 5th Way', 320);

/* Vistas */

/*  vista_viajes */

CREATE OR REPLACE VIEW vista_viajes AS
SELECT
    c.first_name AS chofer_first_name,
    c.last_name AS chofer_last_name,
    v.patent AS vehiculo_patent,
    v.name_truck AS vehiculo_name_truck,
    p.name_product AS producto_name_product,
    p.cant AS producto_cant,
    ed.name_company_d AS empresa_destino_name_company_d,
    ed.date_company_d AS empresa_destino_date_company_d,
    ed.address_company_d AS empresa_destino_address_company_d
    
FROM transporte t 

JOIN
    chofer c ON t.id_driver = c.id_driver
JOIN
    vehiculo v ON t.id_truck = v.id_truck
JOIN
    producto p ON t.id_transport = p.id_transport
JOIN
    empresa_destino ed ON p.id_product = ed.id_product;
    
    /* vista_vencimiento_vehiculos */
    
CREATE VIEW vista_vencimientos_vehiculos AS
SELECT
    v.id_truck,
    v.patent,
    v.name_truck,
    vv.vtv AS vencimiento_vtv,
    vv.seguro AS vencimiento_seguro,
    vv.cedula AS vencimiento_cedula
FROM vehiculo v
JOIN venc_vehiculo vv ON v.id_venc_vehiculo = vv.id_venc_vehiculo;

/* vista_vencimientos_choferes */

CREATE VIEW vista_vencimientos_choferes AS
SELECT
    ch.id_driver,
    ch.first_name,
    ch.last_name,
    vc.register AS vencimiento_register,
    vc.gral_load AS vencimiento_gral_load,
    vc.danger_load AS vencimiento_danger_load,
    vc.psycho AS vencimiento_psycho
FROM chofer ch
JOIN vencimiento_chofer vc ON ch.id_vencimiento_driver = vc.id_vencimiento_driver;

/* vista_pagos */

CREATE VIEW vista_pagos AS
SELECT
    p.id_pay,
    p.importe,
    p.buy_order,
    p.num_order_pay,
    p.date_pay,
    p.address,
    e.name_company AS nombre_empresa
FROM pago p
JOIN empresa e ON p.id_company = e.id_company;

/* compra_destino*/

CREATE VIEW compra_destino AS
SELECT
    t.id_transport,
    e.name_company AS nombre_empresa,
    pa.address,
    pr.name_product,
    ed.name_company_d,
    ed.date_company_d,
    ed.address_company_d
FROM transporte t
JOIN chofer c ON t.id_driver = c.id_driver
JOIN vehiculo v ON t.id_truck = v.id_truck
JOIN producto pr ON t.id_transport = pr.id_transport
JOIN empresa_destino ed ON pr.id_product = ed.id_product
JOIN pago pa ON t.id_pay = pa.id_pay
JOIN empresa e ON pa.id_company = e.id_company;
DELIMITER ;;
/* Store Procedure*/
/* ordenar table*/
CREATE PROCEDURE `get_order_table`(IN field VARCHAR(20), order_by VARCHAR(10))
BEGIN
IF field <> '' AND order_by <> '' THEN
	SET @empresa_order = concat(' ORDER BY ', field, ' ', order_by);
		ELSEIF field <> '' AND order_by = '' THEN
		SET @empresa_order = concat(' ORDER BY ', field);
  END IF;
	SET @clausula = concat('SELECT * FROM empresa', @empresa_order);
	PREPARE runSQL FROM @clausula;
	EXECUTE runSQL;
	DEALLOCATE PREPARE runSQL;
END; 

/* nuevo pago*/
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_pay`(IN new_importe INT, num_empresa INT)
BEGIN
	DECLARE max_orden_de_compra INT;
    DECLARE max_numero_de_remito INT;
    DECLARE max_id_pay INT;
SELECT 
        MAX(buy_order) AS max_orden_de_compra, 
        MAX(num_order_pay) AS max_numero_de_remito, 
        MAX(id_pay) AS max_id_pay

    INTO max_orden_de_compra, max_numero_de_remito, max_id_pay
    FROM pago;
    SET @nuevo_oc = max_orden_de_compra + 1;
    SET @nuevo_nr = max_numero_de_remito + 1;
    SET @nuevo_id = max_id_pay +1;
    
SET @direccion = (SELECT address FROM pago where id_company = num_empresa LIMIT 1);

	IF new_importe <> '' AND num_empresa <> '' THEN
    
		INSERT INTO pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) 
		VALUES ( @nuevo_id, new_importe, @nuevo_oc, @nuevo_nr, CURRENT_DATE(), @direccion, num_empresa );
        
    END IF;
END;

/* Triggers */
/* producto_update */
CREATE TABLE producto_update (
    id_product INT,
    name_product VARCHAR(50) ,
    desc_product VARCHAR(225),
    dangerous BOOLEAN ,
    kg FLOAT,
    cant INT 
);

CREATE TRIGGER `tr_producto_cambiado`
BEFORE UPDATE ON producto
    FOR EACH ROW
        INSERT INTO producto_update (id_product, name_product, desc_product, dangerous, kg, cant) 
        VALUES (OLD.id_product, OLD.name_product, OLD.desc_product, OLD.dangerous, OLD.kg, OLD.cant);
    
UPDATE producto
SET name_product = 'Indosil 266', desc_product = 'Tambor de alta rentabilidad y retencion de liquidos',
    dangerous = TRUE, kg = 200.24, cant = 40
    WHERE id_product = 15;

/* delete_empresa_destino */
CREATE TABLE log_delete_empresa_destino (
    id_company_d INT,
    name_company_d VARCHAR(50),
    cuit_company_d VARCHAR(12) UNIQUE ,
    date_company_d DATE ,
    address_company_d VARCHAR(120) ,
    id_product INT
);

CREATE TRIGGER `tr_log_detele_empresa_destino` 
AFTER DELETE ON empresa_destino
    FOR EACH ROW
        INSERT INTO log_delete_empresa_destino (id_company_d, name_company_d, cuit_company_d, date_company_d, address_company_d, id_product) 
        VALUES (OLD.id_company_d, OLD.name_company_d, OLD.cuit_company_d,  OLD.date_company_d, OLD.address_company_d, OLD.id_product);

/* control_pago_insercion */
CREATE TABLE log_pago (
    id_pay INT,
    importe INT,
    buy_order INT NOT NULL ,
    num_order_pay INT NOT NULL,
    date_pay DATE NOT NULL,
    address VARCHAR(75) NOT NULL,
    id_company INT,
    PRIMARY KEY (id_pay, id_company),
        CONSTRAINT FK_LOG_ID_COMPANY
        FOREIGN KEY (id_company)
        REFERENCES empresa (id_company)
);

CREATE TRIGGER `tr_log_pago_de_empresa`
AFTER INSERT ON pago
FOR EACH ROW
INSERT INTO log_pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company)
VALUES (NEW.id_pay, NEW.importe, NEW.buy_order, NEW.num_order_pay, NEW.date_pay, NEW.address, NEW.id_company);

CREATE TABLE control_log_pago (
id_pay INT PRIMARY KEY,
fecha DATE,
hora TIME,
usuario VARCHAR(75)
);

CREATE TRIGGER `tr_control_user_pago`
 BEFORE INSERT ON pago
 FOR EACH ROW
 INSERT INTO control_log_pago (id_pay, fecha, hora, usuario) VALUES ( NEW.id_pay, CURRENT_DATE(), CURRENT_TIME(), USER());
 
 
 /* Funciones */
 /* ganancias_totales_por_mes */
 CREATE DEFINER=`root`@`localhost` FUNCTION `ganancias_totales_por_mes`(anio_param date) RETURNS int
    DETERMINISTIC
BEGIN
  DECLARE total_ganancias int;
  SELECT SUM(importe) INTO total_ganancias
  FROM pago
  WHERE MONTH(date_pay) = MONTH(anio_param)
  ;
  RETURN total_ganancias;
END ;;
/* contar_viajes_por_conductor */
CREATE DEFINER=`root`@`localhost` FUNCTION `contar_viajes_por_conductor`(id_driver_param INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE viajes_count INT;
    SELECT COUNT(*) INTO viajes_count
    FROM transporte
    WHERE id_driver = id_driver_param;
    RETURN viajes_count;
END ;;
