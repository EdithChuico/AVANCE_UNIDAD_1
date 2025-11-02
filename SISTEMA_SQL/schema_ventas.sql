-- 1. Tabla Clientes (id_cliente, nombre, apellido, cedula,email, ciudad)
CREATE TABLE Clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
	apellido VARCHAR(100) NOT NULL,
	cedula VARCHAR(10),
    email VARCHAR(100) UNIQUE,
    ciudad VARCHAR(50)
);
-- 2. Tabla Sucursales (id_sucursal, nombre_sucursal, ciudad)
CREATE TABLE Sucursales (
    id_sucursal SERIAL PRIMARY KEY,
    nombre_sucursal VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50) NOT NULL
);
-- 3. Tabla Empleados (id_empleado, nombre, apellido, cargo)
CREATE TABLE Empleados (
    id_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
	apellido VARCHAR(100) NOT NULL,
    cargo VARCHAR(50)
);
-- 4. Tabla Ventas (id_venta, id_cliente, id_sucursal, id_empleado, fecha_venta)
CREATE TABLE Ventas (
    id_venta SERIAL PRIMARY KEY,
    id_cliente INTEGER NOT NULL,
    id_sucursal INTEGER NOT NULL,
    id_empleado INTEGER,
    fecha_venta TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Claves Foráneas (Indican las relaciones 'Obtienen', 'Ubicacion', 'Realizan')
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_sucursal) REFERENCES Sucursales(id_sucursal),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);
-- 5. Tabla Detalle_Ventas (id_detalle, id_venta, sku_producto, cantidad, precio_venta_momento)
CREATE TABLE Detalle_Ventas (
    id_detalle SERIAL PRIMARY KEY,
    id_venta INTEGER NOT NULL,
    sku_producto VARCHAR(50) NOT NULL, -- Campo de conexión con MongoDB
    cantidad INTEGER NOT NULL CHECK (cantidad > 0),
    precio_venta_momento NUMERIC(10, 2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta)
);
-- INSERCIÓN DE DATOS (EXTRA)
INSERT INTO Clientes (nombre, apellido, cedula, email, ciudad) VALUES
('Edith', 'Chuico', '2350370967', 'elchuico@espe.edu.ec', 'Santo Domingo'),
('Juan', 'Perez', '1712345678', 'juan.perez@mail.com', 'Quito');
INSERT INTO Sucursales (nombre_sucursal, ciudad) VALUES
('TechStore SD', 'Santo Domingo'),
('TechStore SG', 'Sangolquí');
INSERT INTO Empleados (nombre, apellido, cargo) VALUES
('Maria', 'Lopez', 'Vendedor Senior'),
('Carlos', 'Gomez', 'Cajero');
INSERT INTO Ventas (id_cliente, id_sucursal, id_empleado, fecha_venta) VALUES
(1, 1, 1, '2025-10-30 10:29:00'),
(2, 2, 2, '2025-10-30 10:30:00');
INSERT INTO Detalle_Ventas (id_venta, sku_producto, cantidad, precio_venta_momento) VALUES
(1, 'SMART-001', 1, 450.00),
(2, 'LAPTOP-005', 1, 980.50),
(1, 'MON-003', 2, 125.99);
