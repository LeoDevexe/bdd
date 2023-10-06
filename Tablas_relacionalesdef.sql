--RELACION UNO A Muchos CUENTAS CON usuario
CREATE TABLE usuario (
   cedula char (5) PRIMARY KEY,
	nombre varchar (25) NOT NULL,
	apellido varchar (25) NOT NULL,
  tipo_cuenta VARCHAR(20),
  limite_credito DECIMAL(10, 2)
); 



create table cuentas(
	numero_cuenta char(5)PRIMARY KEY,
	cedula_propietario char(5) not null,
	fecha_creacion date not null,
	saldo money not null,
	 FOREIGN KEY (cedula) REFERENCES usuario(cedula)
);




--RELACION UNO A MUCHOS CLIENTES CON COMPRAS 
CREATE TABLE clientes (
  cedula char(10) PRIMARY KEY,
  nombre varchar (50),
  apellido varchar (50),
	edad int ,
constraint clientes_pk primary key (cedula)
);



CREATE TABLE compras (
  id_compra INT PRIMARY KEY,
  cedula char(10),
  fecha_compra DATE,
  monto DECIMAL(10, 2),
  FOREIGN KEY (cedula) REFERENCES clientes(cedula)
);





--RELACION DE UNO A MUCHOS ESTUDIANTES CON PROFESORES

CREATE TABLE estudiantes (
	cedula char (10) PRIMARY KEY,
	nombre varchar (50) not null,
	apellido varchar (50) not null,
	email varchar (50) not null, 
     fecha_nacimiento date,
  	codigo_profesor INT,
    FOREIGN KEY (codigo_profesor) REFERENCES Profesores(codigo)
);






CREATE TABLE Profesores (
  codigo INT NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  constraint Profesores_pk primary key (codigo)
);


	---RELACION UNO A MUCHOS ENTRE PERSONA Y PRESTAMO
CREATE TABLE persona (
  cedula char (10) not null PRIMARY KEY,
	nombre varchar (50) not null,
	apellido varchar (50) not null,
	estatura decimal (10,2),
	fecha_nacimiento date not null,
   hora_nacimiento time ,
   cantidad_ahorrada money,
   numero_hijos int
   constraint persona_pk primary key(cedula)
);


CREATE TABLE prestamo (
  cedula char(10) PRIMARY KEY,
	monto money,
	fecha_prestamo date,
	hora_prestamo time,
	garante varchar (40),
  FOREIGN KEY (cedula) REFERENCES persona(cedula)
);



---RELACION UNO A MUCHOS PRODUCTOS CON VENTAS
Create table productos(
	codigo int not null,
	nombre  varchar(50) not null,
	descripcion  varchar (200) ,
	precio money not null,
	stock int not null,
	constraint productos_pk primary key (codigo)
)



CREATE TABLE ventas (
  id_venta INT PRIMARY KEY,
  codigo_producto INT,
  fecha_venta DATE,
  cantidad INT,
  FOREIGN KEY (codigo_producto) REFERENCES productos(codigo)
);




--RELACION UNO A MUCHOS ENTRE TRANSACCIONES CON BANCO
Create table transacciones(
codigo int not null, 
numero_cuenta char (5) not null,
monto money not null,
tipo char (1) not null,
fecha date,
hora time,
constraint transacciones_pk primary key (codigo)
)

CREATE TABLE banco (
	codigo_banco INT PRIMARY KEY,
  codigo INT ,
  detalle VARCHAR(100),
  FOREIGN KEY (codigo) REFERENCES transacciones(codigo)
);






--RELACION UNO A MUCHOS VIDEOJUEGOS CON PLATAFORMAS
create table videojuegos(
	codigo int not null,
	nombre varchar(100) not null,
	descripcion varchar(300),
	valoracion int not null,
	constraint codigo_videojuego_pk primary key(codigo)
)


CREATE TABLE plataformas (
  id_plataforma INT PRIMARY KEY,
  nombre_plataforma VARCHAR(50) NOT NULL,
  codigo_videojuego INT,
  FOREIGN KEY (codigo_videojuego) REFERENCES videojuegos(codigo)
);




--REGISTROS_ENTRADA UNO A MUCHOS CON EMPELADO
create table registros_entrada(
	codigo_registro int not null,
	cedula_empleado char(10) not null,
	fecha date not null,
	hora time not null,
	constraint codigo_registro_pk primary key(codigo_registro)
)


create table empleado(
	codigo_registro int not null primary key,
	nombre varchar(25) not null,
	FOREIGN KEY (codigo_registro) REFERENCES registros_entrada(codigo_registro)
)




