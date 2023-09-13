CREATE DEFINER=`root`@`localhost` FUNCTION `ganancias_totales_por_mes`(anio_param date) RETURNS int
    DETERMINISTIC
BEGIN
  DECLARE total_ganancias int;
  SELECT SUM(importe) INTO total_ganancias
  FROM pago
  WHERE MONTH(date_pay) = MONTH(anio_param)
  ;
  RETURN total_ganancias;
END