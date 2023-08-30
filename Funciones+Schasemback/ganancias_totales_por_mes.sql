CREATE DEFINER=`root`@`localhost` FUNCTION `ganancias_totales_por_mes`(anio_param INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE total_ganancias DECIMAL(10, 2);
    SELECT SUM(importe) INTO total_ganancias
    FROM pago
    WHERE YEAR(date_pay) = anio_param;
    RETURN total_ganancias;
END