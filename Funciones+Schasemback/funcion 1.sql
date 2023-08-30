CREATE DEFINER=`root`@`localhost` FUNCTION `contar_viajes_por_conductor`(id_driver_param INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE viajes_count INT;
    SELECT COUNT(*) INTO viajes_count
    FROM transporte
    WHERE id_driver = id_driver_param;
    RETURN viajes_count;
END