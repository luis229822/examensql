-- Crear la base de datos
CREATE DATABASE luisguillermomontenegrorodriguez;

USE luisguillermomontenegrorodriguez;

-- Tabla de Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    ruc VARCHAR(11) UNIQUE NOT NULL,
    direccion TEXT NOT NULL
);

-- Tabla de Vendedores
CREATE TABLE Vendedores (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL
);

-- Tabla de Facturas
CREATE TABLE Facturas (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    numero_factura VARCHAR(20) UNIQUE NOT NULL,
    fecha DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    condicion_pago VARCHAR(20) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    igv DECIMAL(10,2) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES Vendedores(id_vendedor)
);

-- Tabla de Productos
CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    descripcion TEXT NOT NULL,
    precio_unitario DECIMAL(10,4) NOT NULL
);

-- Tabla de Detalle de Factura
CREATE TABLE Detalle_Factura (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_factura INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad DECIMAL(10,2) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_factura) REFERENCES Facturas(id_factura),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);


-- Insertar Cliente
INSERT INTO Clientes (nombres, apellidos, ruc, direccion) 
VALUES ('luis', 'montenegro Rodriguez', '10105932028', 'maz e lt 7');

INSERT INTO Clientes (nombres, apellidos, ruc, direccion) 
VALUES ('Sofia', 'Caballero Sopan', '10105932029', 'jr. los angeles 8');

INSERT INTO Clientes (nombres, apellidos, ruc, direccion) 
VALUES ('Rodrigo', 'Messi Panpañaupa', '10105932069', 'los cedros m T Lt. 8');

INSERT INTO Clientes (nombres, apellidos, ruc, direccion) 
VALUES ('Ronald', 'Caballero Sopan', '10105952023', 'av. pacifico 238');


-- Insertar Vendedor
INSERT INTO Vendedores (nombres, apellidos) VALUES 
('Bob', 'Esponja');
INSERT INTO Vendedores (nombres, apellidos) VALUES 
('Gianina', 'leon Rojas');
INSERT INTO Vendedores (nombres, apellidos) VALUES 
('laura', 'bozzo villegas');
INSERT INTO Vendedores (nombres, apellidos) VALUES 
('Mario', ' vargas llosa');


INSERT INTO Facturas (numero_factura, fecha, id_cliente, id_vendedor, condicion_pago, subtotal, igv, total) VALUES
('F002-00000345', '2018-01-24', 1, 1, 'CONTADO C/E', 241.53, 43.47, 286.00);
INSERT INTO Facturas (numero_factura, fecha, id_cliente, id_vendedor, condicion_pago, subtotal, igv, total) VALUES
('F002-00000346', '2018-02-15', 2, 2, 'CRÉDITO', 320.00, 57.60, 377.60);
INSERT INTO Facturas (numero_factura, fecha, id_cliente, id_vendedor, condicion_pago, subtotal, igv, total) VALUES
('F002-00000347', '2018-03-10', 3, 3, 'CONTADO', 150.75, 27.13, 177.88);
INSERT INTO Facturas (numero_factura, fecha, id_cliente, id_vendedor, condicion_pago, subtotal, igv, total) VALUES
('F002-00000348', '2018-04-05', 4, 4, 'CRÉDITO', 500.00, 90.00, 590.00);

-- Insertar Productos
INSERT INTO Productos (codigo, descripcion, precio_unitario) VALUES
('DRI000012', 'DRILL 2B01 1RA GOLDEN POL', 8.0508);
INSERT INTO Productos (codigo, descripcion, precio_unitario) VALUES
('TEX000024', 'TELA JEAN AZUL OSCURO', 12.5000);
INSERT INTO Productos (codigo, descripcion, precio_unitario) VALUES
('ALG000078', 'ALGODÓN PREMIUM BLANCO', 7.2500);
INSERT INTO Productos (codigo, descripcion, precio_unitario) VALUES
('POLY000056', 'POLIÉSTER RESISTENTE NEGRO', 9.7500);

-- Insertar Detalle de Factura
INSERT INTO Detalle_Factura (id_factura, id_producto, cantidad, total) VALUES
(1, 1, 30.00, 241.53);
INSERT INTO Detalle_Factura (id_factura, id_producto, cantidad, total) VALUES
(2, 2, 25.00, 320.00);
INSERT INTO Detalle_Factura (id_factura, id_producto, cantidad, total) VALUES
(3, 3, 20.80, 150.75);
INSERT INTO Detalle_Factura (id_factura, id_producto, cantidad, total) VALUES
(4, 4, 51.28, 500.00);
