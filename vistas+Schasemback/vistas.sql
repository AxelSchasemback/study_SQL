SELECT * FROM transporte;

CREATE OR REPLACE VIEW vista_viajes AS
SELECT
    c.first_name AS chofer_first_name,
    c.last_name AS chofer_last_name,
    v.patent AS vehiculo_patent,
    v.name_truck AS vehiculo_name_truck,
    p.name_product AS producto_name_product,
    p.cant AS producto_cant,
    ed.name_company_d AS empresa_destino_name_company_d,
    ed.date_company_d AS empresa_destino_date_company_d,
    ed.address_company_d AS empresa_destino_address_company_d
    
FROM transporte t 

JOIN
    chofer c ON t.id_driver = c.id_driver
JOIN
    vehiculo v ON t.id_truck = v.id_truck
JOIN
    producto p ON t.id_transport = p.id_transport
JOIN
    empresa_destino ed ON p.id_product = ed.id_product;
    

SELECT * FROM vista_viajes;

CREATE VIEW vista_vencimientos_vehiculos AS
SELECT
    v.id_truck,
    v.patent,
    v.name_truck,
    vv.vtv AS vencimiento_vtv,
    vv.seguro AS vencimiento_seguro,
    vv.cedula AS vencimiento_cedula
FROM vehiculo v
JOIN venc_vehiculo vv ON v.id_venc_vehiculo = vv.id_venc_vehiculo;

SELECT * FROM vista_vencimientos_vehiculos;

CREATE VIEW vista_vencimientos_choferes AS
SELECT
    ch.id_driver,
    ch.first_name,
    ch.last_name,
    vc.register AS vencimiento_register,
    vc.gral_load AS vencimiento_gral_load,
    vc.danger_load AS vencimiento_danger_load,
    vc.psycho AS vencimiento_psycho
FROM chofer ch
JOIN vencimiento_chofer vc ON ch.id_vencimiento_driver = vc.id_vencimiento_driver;

SELECT * FROM vista_vencimientos_choferes;

CREATE VIEW vista_pagos AS
SELECT
    p.id_pay,
    p.importe,
    p.buy_order,
    p.num_order_pay,
    p.date_pay,
    p.address,
    e.name_company AS nombre_empresa
FROM pago p
JOIN empresa e ON p.id_company = e.id_company;

SELECT * FROM vista_pagos;

CREATE VIEW compra_destino AS
SELECT
    t.id_transport,
    e.name_company AS nombre_empresa,
    pa.address,
    pr.name_product,
    ed.name_company_d,
    ed.date_company_d,
    ed.address_company_d
FROM transporte t
JOIN chofer c ON t.id_driver = c.id_driver
JOIN vehiculo v ON t.id_truck = v.id_truck
JOIN producto pr ON t.id_transport = pr.id_transport
JOIN empresa_destino ed ON pr.id_product = ed.id_product
JOIN pago pa ON t.id_pay = pa.id_pay
JOIN empresa e ON pa.id_company = e.id_company;

SELECT * FROM compra_destino;