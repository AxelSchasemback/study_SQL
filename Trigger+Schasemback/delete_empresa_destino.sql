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

SELECT * FROM log_delete_empresa_destino;

DELETE FROM empresa_destino WHERE id_company_d = 320;

SELECT * FROM empresa_destino ;