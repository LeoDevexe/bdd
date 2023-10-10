--1
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

ALTER TABLE cuentas
Add constraint cedula_pk 
FOREIGN KEY (cedula) REFERENCES usuario(cedula)


SELECT numero_cuenta, nombre FROM cuentas,usuario
WHERE saldo > money(100) AND saldo < money(1000)

SELECT * FROM cuentas WHERE fecha_creacion BETWEEN '2022-09-21' AND '2023-09-21';


-----2---

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

SELECT nombre, apellido FROM clientes WHERE cedula LIKE '%7%';

SELECT * FROM clientes WHERE cedula = (SELECT cedula FROM clientes WHERE nombre = 'Monica');


----3
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



ALTER TABLE estudiantes
add constraint codigo_profesor_fk
FOREIGN KEY (codigo_profesor)REFERENCES Profesores(codigo)



CREATE TABLE Profesores (
  codigo INT NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  constraint Profesores_pk primary key (codigo)
);

SELECT * FROM  estudiantes WHERE codigo_profesor = (SELECT codigo FROM profesores WHERE nombre = 'FRANCISCO');
SELECT Profesores.codigo,estudiantes.nombre,estudiantes.apellido from Profesores,estudiantes where apellido like '%n'

SELECT * FROM Profesores
-----4
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

SELECT * FROM persona prestamo WHERE cedula = (SELECT cedula FROM persona WHERE nombre = 'Sean');
select cantidad_ahorrada,monto,garante from persona,prestamo where monto > money(100) and monto< money(1000)   



-- 5

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


SELECT * FROM  ventas WHERE codigo_producto = (SELECT codigo FROM productos WHERE nombre = 'Deja');
----CONSULTA NUEVA
SELECT nombre,stock FROM productos WHERE codigo =(SELECT codigo_producto FROM ventas WHERE cantidad= 5);
select nombre,stock,cantidad from productos,ventas  where nombre like '%m%' or descripcion='0'



---6
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



SELECT * FROM transacciones WHERE codigo = (SELECT codigo FROM banco WHERE codigo_banco=1  );
Select * from transacciones,banco where tipo='C' and numero_Cuenta between '22001' and '22004'


---7
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

SELECT * FROM  plataformas WHERE codigo_videojuego = (SELECT codigo FROM videojuegos WHERE nombre = 'God of war');
select * from videojuegos,plataformas where descripcion='Guerra' and valoracion > 7 and nombre like'C%' or valoracion > 8 and nombre like'D%' 

SELECT * FROM videojuegos
---8
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

							
SELECT * FROM  empleado WHERE codigo_registro = (SELECT codigo_registro FROM registros_entrada WHERE cedula_empleado = '2201');
select cedula_empleado,fecha,nombre from registros_entrada,empleado where fecha between '01/08/2023' and '31/08/2023' or cedula_empleado like '17%' and hora between '08:00' and '12:00'
or fecha between '06/10/2023' and '20/10/2023' and cedula_empleado like '08%' and hora between '09:00' and '13:00'

SELECT cedula_empleado,fecha,nombre FROM registros_entrada,empleado where

insert into registros_entrada values (11,'1578963587','2023/10/01','09:00'),
									 (12,'1576923224','2023/10/02','13:00'),
									 (13,'1789635021','2023/10/03','12:00'),
									 (14,'1236574896','2023/10/04','11:00'),
									 (15,'1578963587','2023/10/05','10:00'),
									 (16,'1578963587','2023/10/06','11:00'),
									 (17,'1578963587','2023/10/07','09:00'),
									 (18,'1578963587','2023/10/08','12:00'),
									 (19,'1578963587','2023/10/15','13:00');
									 


SELECT * FROM registros_entrada













