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
END