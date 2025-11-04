
CREATE DATABASE IF NOT EXISTS techstore_sales
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_0900_ai_ci;
USE techstore_sales;


DROP TABLE IF EXISTS detalle_ventas;
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS sucursales;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
  id_cliente      CHAR(36) NOT NULL DEFAULT (UUID()) PRIMARY KEY,
  nombre          VARCHAR(120) NOT NULL,
  email           VARCHAR(180),
  ciudad          VARCHAR(80),
  CONSTRAINT email_formato_chk
    CHECK (email IS NULL OR email REGEXP '^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$')
) ENGINE=InnoDB;

CREATE TABLE sucursales (
  id_sucursal     CHAR(36) NOT NULL DEFAULT (UUID()) PRIMARY KEY,
  nombre_sucursal VARCHAR(120) NOT NULL,
  ciudad          VARCHAR(80)  NOT NULL
) ENGINE=InnoDB;


CREATE TABLE ventas (
  id_venta        CHAR(36) NOT NULL DEFAULT (UUID()) PRIMARY KEY,
  id_cliente      CHAR(36) NOT NULL,
  id_sucursal     CHAR(36) NOT NULL,
  fecha_venta     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT ventas_cliente_fk  FOREIGN KEY (id_cliente)  REFERENCES clientes(id_cliente),
  CONSTRAINT ventas_sucursal_fk FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
) ENGINE=InnoDB;


CREATE TABLE detalle_ventas (
  id_detalle            BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_venta              CHAR(36) NOT NULL,
  sku_producto          VARCHAR(6) NOT NULL,
  cantidad              INT NOT NULL,
  precio_venta_momento  DECIMAL(12,2) NOT NULL,
  CONSTRAINT detalle_ventas_venta_fk
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta) ON DELETE CASCADE,
  CONSTRAINT cantidad_chk CHECK (cantidad > 0),
  CONSTRAINT precio_chk   CHECK (precio_venta_momento >= 0),
  CONSTRAINT sku_formato_chk CHECK (sku_producto REGEXP '^[A-Z]{2}[0-9]{4}$')
) ENGINE=InnoDB;



INSERT INTO clientes (nombre, email, ciudad)
VALUES ('Juan Pérez', 'juan.perez@example.com', 'Quito'),
       ('María López', 'maria.lopez@example.com', 'Guayaquil');

INSERT INTO sucursales (nombre_sucursal, ciudad)
VALUES ('Quito Centro', 'Quito'),
       ('Guayaquil Mall', 'Guayaquil');

SET @cli := (SELECT id_cliente FROM clientes WHERE nombre='Juan Pérez' LIMIT 1);
SET @suc := (SELECT id_sucursal FROM sucursales WHERE nombre_sucursal='Quito Centro' LIMIT 1);

INSERT INTO ventas (id_cliente, id_sucursal)
VALUES (@cli, @suc);

SET @venta := (SELECT id_venta FROM ventas ORDER BY fecha_venta DESC LIMIT 1);

INSERT INTO detalle_ventas (id_venta, sku_producto, cantidad, precio_venta_momento)
VALUES (@venta, 'SM0021', 1, 799.00),
       (@venta, 'HP7512', 1, 1199.00);

