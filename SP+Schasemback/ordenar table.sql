CREATE DEFINER=`root`@`localhost` PROCEDURE `get_order_table`(IN field VARCHAR(20), order_by VARCHAR(10))
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
END