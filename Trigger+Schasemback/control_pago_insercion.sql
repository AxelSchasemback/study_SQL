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

SELECT * FROM log_pago;

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
 
 SELECT * FROM control_log_pago;
 