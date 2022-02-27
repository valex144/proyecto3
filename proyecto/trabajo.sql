
CREATE SCHEMA `trabajo1`;
USE `trabajo1` ;


CREATE TABLE trabajo1.Clientes (
  ID_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Apellidos VARCHAR(80) NOT NULL,
  Nombres VARCHAR(80) NOT NULL,
  Direccion VARCHAR(100) NOT NULL,
  Ciudad VARCHAR(45) NOT NULL,
  Pais VARCHAR(45) NOT NULL,
  Celular CHAR(9) NOT NULL,
  Fax VARCHAR(45) NOT NULL,
  Fecha_ingreso DATE NOT NULL,
  Dni_vigente VARCHAR(45) NOT NULL
  );



CREATE TABLE trabajo1.vendedor (
  ID_vendedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nombre_vendedor VARCHAR(100) NOT NULL
  );

CREATE TABLE trabajo1.articulo (
  ID_articulo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  descripcion VARCHAR(100) NOT NULL,
  precio_unitario FLOAT NOT NULL,
  stock INT NOT NULL
  );

CREATE TABLE  trabajo1.pedido (
  ID_pedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  ID_cliente INT NOT NULL,
  ID_vendedor INT NOT NULL,
  fecha_pedido DATE NOT NULL,
  subtotal FLOAT NOT NULL,
  impuesto FLOAT NOT NULL,
  total FLOAT NOT NULL,
  estado VARCHAR(45) NOT NULL,
  Clientes_ID int,
  Vendedor_ID int,
  FOREIGN KEY (Clientes_ID) REFERENCES Clientes(ID_cliente) ON DELETE CASCADE, -- con on delete cascade se asume la relacion total --
  FOREIGN KEY (Vendedor_ID) REFERENCES Vendedor(ID_vendedor) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS trabajo1.detalle_pedido (
  ID_pedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  ID_articulo VARCHAR(45) NOT NULL,
  cantidad INT NOT NULL,
  precio FLOAT NOT NULL,
  subtotal FLOAT NOT NULL,
  pedido_ID INT NOT NULL,
  pedido_Clientes_ID INT NOT NULL,
  pedido_vendedor_ID INT NOT NULL,
  articulo_ID INT NOT NULL,
   FOREIGN KEY (pedido_ID) REFERENCES Pedido(ID_pedido) ON DELETE CASCADE,
   FOREIGN KEY (pedido_Clientes_ID) REFERENCES Clientes(ID_cliente) ON DELETE CASCADE,
   FOREIGN KEY (pedido_vendedor_ID) REFERENCES vendedor(ID_vendedor) ON DELETE CASCADE,
   FOREIGN KEY (articulo_ID) REFERENCES articulo(ID_articulo) ON DELETE CASCADE
);
