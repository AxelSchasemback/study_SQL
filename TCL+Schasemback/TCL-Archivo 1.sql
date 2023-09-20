SELECT @@autocommit;
SET @@autocommit = 0;

SELECT * FROM pago;
START TRANSACTION;
    DELETE FROM pago
    ORDER BY id_pay DESC
    LIMIT 5;

ROLLBACK;
COMMIT;