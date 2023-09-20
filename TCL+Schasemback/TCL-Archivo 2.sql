SELECT @@autocommit;
SET @@autocommit = 0;

START TRANSACTION;
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (330, 285588, 330, 330, '2019-07-17', '16 Esch Point', 32);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (331, 185517, 331, 331, '2023-03-24', '84 Schmedeman Junction', 35);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (332, 345839, 332, 332, '2017-04-08', '16 Esch Point', 32);
SAVEPOINT a;
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (333, 151533, 333, 333, '2023-07-03', '87653 Homewood Junction', 11);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (334, 341410, 334, 334, '2022-03-03', '889 Toban Terrace', 16);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (335, 197472, 335, 335, '2018-07-09', '881 Carberry Center', 27);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (336, 204641, 336, 336, '2020-01-29', '16 Esch Point', 32);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (337, 298289, 337, 337, '2022-06-01', '87588 Dottie Lane', 26);
insert into pago (id_pay, importe, buy_order, num_order_pay, date_pay, address, id_company) values (338, 298586, 338, 338, '2017-06-15', '4289 Becker Court', 23);
SAVEPOINT b;
SELECT * FROM pago;
-- RELEASE SAVEPOINT a;
-- RELEASE SAVEPOINT b;
-- ROLLBACK TO a;
-- ROLLBACK TO b;
-- COMMIT