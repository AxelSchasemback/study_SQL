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
        

SELECT * FROM producto_update;

SELECT * FROM producto;
    
UPDATE producto
SET name_product = 'Indosil 266', desc_product = 'Tambor de alta rentabilidad y retencion de liquidos',
    dangerous = TRUE, kg = 200.24, cant = 40
    WHERE id_product = 15;
