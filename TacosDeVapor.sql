PRAGMA foreign_keys = ON;

-- TABLA CLIENTE

CREATE TABLE cliente (
    cliente_id TEXT PRIMARY KEY,
    nombre TEXT,
    apellido TEXT,
    telefono TEXT,
    email TEXT,
    direccion TEXT,
    fecha_registro TEXT
);


-- TABLA EMPLEADO

CREATE TABLE empleado (
    empleado_id TEXT PRIMARY KEY,
    nombre TEXT,
    apellido TEXT,
    rol TEXT,
    telefono TEXT,
    usuario TEXT,
    fecha_registro TEXT
);


-- TABLA PRODUCTO

CREATE TABLE producto (
    producto_id TEXT PRIMARY KEY,
    nombre TEXT,
    descripcion TEXT,
    tipo TEXT,
    precio_unitario REAL,
    unidad_medida REAL,
    activo INTEGER
);


-- TABLA PEDIDO

CREATE TABLE pedido (
    pedido_id TEXT PRIMARY KEY,
    cliente_id TEXT,
    fecha_pedido TEXT,
    tipo_pago TEXT,
    estado TEXT,
    total REAL,
    empleado_id TEXT,
    FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id),
    FOREIGN KEY (empleado_id) REFERENCES empleado(empleado_id)
);


-- TABLA DETALLE_PEDIDO

CREATE TABLE detalle_pedido (
    detalle_id TEXT PRIMARY KEY,
    pedido_id TEXT,
    producto_id TEXT,
    cantidad REAL,
    precio_unitario REAL,
    sub_total REAL,
    FOREIGN KEY (pedido_id) REFERENCES pedido(pedido_id),
    FOREIGN KEY (producto_id) REFERENCES producto(producto_id)
);


-- TABLA PAGO

CREATE TABLE pago (
    pago_id TEXT PRIMARY KEY,
    pedido_id TEXT,
    fecha_pago TEXT,
    monto REAL,
    metodo TEXT,
    referencia TEXT,
    FOREIGN KEY (pedido_id) REFERENCES pedido(pedido_id)
);


-- TABLA INVENTARIO

CREATE TABLE inventario (
    inventario_id TEXT PRIMARY KEY,
    producto_id TEXT,
    stock_actual REAL,
    stock_minimo REAL,
    ultima_actualizacion TEXT,
    ubicacion TEXT,
    FOREIGN KEY (producto_id) REFERENCES producto(producto_id)
);


-- TABLA EVENTO

CREATE TABLE evento (
    evento_id TEXT PRIMARY KEY,
    pedido_id TEXT,
    fecha_evento TEXT,
    lugar TEXT,
    numero_personas REAL,
    estado TEXT,
    notas TEXT,
    FOREIGN KEY (pedido_id) REFERENCES pedido(pedido_id)
);

-- CLIENTE
INSERT INTO cliente VALUES
('C001', 'Valeria', 'Cortés', '5552211344', 'valeria.cortes@gmail.com', 'Calle Robles 77', '2025-01-11'),
('C002', 'Diego', 'Santos', '5557788992', 'diegos@hotmail.com', 'Av. Hidalgo 102', '2025-01-14'),
('C003', 'Andrea', 'Gallardo', '5553322114', 'andrea.gallardo@gmail.com', 'Fracc. Los Pinos 34', '2025-01-17');

-- EMPLEADO
INSERT INTO empleado VALUES
('E001', 'Miguel', 'Rosales', 'Vendedor', '5559090882', 'miguelr', '2025-01-06'),
('E002', 'Fernanda', 'Cruz', 'Administrador', '5556655443', 'fercruz', '2025-01-09');

-- PRODUCTO 
INSERT INTO producto VALUES
('P001', 'Taco de maiz', 'Taco al vapor de maiz', 'Taco', 12.00, 1, 1),
('P002', 'Taco de harina', 'Taco al vapor de harina con queso', 'Taco', 12.00, 1, 1),
('P003', 'Refresco 600ml', 'Refresco embotellado', 'Bebida', 18.00, 1, 1),
('P004', 'Agua de horchata', 'Vaso de 500ml', 'Bebida', 15.00, 1, 1);

-- INVENTARIO
INSERT INTO inventario VALUES
('I001', 'P001', 180, 50, '2025-02-12', 'Cocina'),
('I002', 'P002', 160, 40, '2025-02-12', 'Cocina'),
('I003', 'P003', 140, 30, '2025-02-12', 'Refrigerador'),
('I004', 'P004', 55, 15, '2025-02-12', 'Refrigerador');

-- PEDIDO
INSERT INTO pedido VALUES
('PED001', 'C001', '2025-02-21', 'Efectivo', 'Completado', 78.00, 'E002'),
('PED002', 'C002', '2025-02-21', 'Tarjeta', 'Completado', 42.00, 'E002'),
('PED003', 'C003', '2025-02-21', 'Efectivo', 'Pendiente', 27.00, 'E001');

-- DETALLE_PEDIDO
INSERT INTO detalle_pedido VALUES
('D001', 'PED001', 'P001', 3, 12.00, 36.00),
('D002', 'PED001', 'P004', 1, 15.00, 15.00),

('D003', 'PED002', 'P002', 2, 12.00, 24.00),
('D004', 'PED002', 'P003', 1, 18.00, 18.00),

('D005', 'PED003', 'P001', 1, 12.00, 12.00),
('D006', 'PED003', 'P002', 1, 12.00, 12.00),
('D007', 'PED003', 'P004', 1, 15.00, 15.00);

-- PAGO
INSERT INTO pago VALUES
('PAG001', 'PED001', '2025-02-21', 40.00, 'Efectivo', 'REF2001'),
('PAG002', 'PED002', '2025-02-21', 25.00, 'Tarjeta', 'REF2002');

-- EVENTO
INSERT INTO evento VALUES
('EV001', 'PED001', '2025-03-03', 'Centro Cívico', 25, 'Entregado', 'Desayuno empresarial'),
('EV002', 'PED003', '2025-03-07', 'Casa Encinos', 12, 'Pendiente', 'Reunión vecinal');

-- SELECTS

SELECT * FROM cliente;
SELECT * FROM empleado;
SELECT * FROM producto;
SELECT * FROM pedido;
SELECT * FROM detalle_pedido;
SELECT * FROM pago;
SELECT * FROM inventario;
SELECT * FROM evento;