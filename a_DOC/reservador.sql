CREATE DATABASE reservador;

USE reservador;

--empresa
DROP TABLE IF EXISTS empresa;

CREATE TABLE empresa (
  empresa_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  empresa_nombre VARCHAR(100),
  empresa_ubicacion VARCHAR(100),
  empresa_horario_atencion VARCHAR(50),
  empresa_telefono VARCHAR(10),
  empresa_email VARCHAR(100)
) ENGINE = InnoDB;

--usuario
DROP TABLE IF EXISTS usuario;

CREATE TABLE usuario (
  usuario_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  usuario_nombres VARCHAR(100),
  usuario_apellidos VARCHAR(100),
  usuario_cedula VARCHAR(10),
  usuario_telefono VARCHAR(10),
  usuario_email VARCHAR(60),
  usuario_genero VARCHAR(10),
  usuario_foto VARCHAR(10),
  usuario_nacimiento VARCHAR(10),
  usuario_user VARCHAR(60),
  usuario_pass VARCHAR(60),
  usuario_autorize TINYINT(1),
  usuario_admin TINYINT(1)
) ENGINE = InnoDB;

INSERT INTO
  usuario
VALUES
  (
    1,
    "Administrador",
    "Administrador",
    "",
    "",
    "admin@gmail.com",
    "Masculino",
    null,
    "1998-08-04",
    "admin",
    "21232f297a57a5a743894a0e4a801fc3",
    1,
    1
  );

--producto
DROP TABLE IF EXISTS producto;

CREATE TABLE producto (
  producto_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  producto_nombre VARCHAR(60),
  producto_precio DOUBLE,
  producto_descripcion TEXT,
  producto_img TEXT
) ENGINE = InnoDB;

--pedido
DROP TABLE IF EXISTS pedido;

CREATE TABLE pedido (
  pedido_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  pedido_fecha VARCHAR(20),
  pedido_cantidad INT,
  usuario_id INT,
  FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id)
) ENGINE = InnoDB;

--pedido_producto
DROP TABLE IF EXISTS pedido_producto;

CREATE TABLE pedido_producto (
  pedido_producto_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  pedido_producto_cantidad INT,
  pedido_producto_precio DOUBLE,
  pedido_id INT,
  producto_id INT,
  FOREIGN KEY (pedido_id) REFERENCES pedido (pedido_id),
  FOREIGN KEY (producto_id) REFERENCES producto (producto_id)
) ENGINE = InnoDB;