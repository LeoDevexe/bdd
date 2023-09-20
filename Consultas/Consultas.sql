--Tabla productos

Create table productos(
	codigo int not null,
	nombre  varchar(50) not null,
	descripcion  varchar (200) ,
	precio money not null,
	stock int not null,
	constraint productos_pk primary key (codigo)
)

--Consultas Productos
select * from productos where nombre like'Q%'
select * from productos where descripcion isnull
select * from productos where precio >= money (2) and precio <= money (3)

--Tabla cuentas
create table cuentas(
	numero_cuenta char(5) not null,
	cedula_propietario char(5) not null,
	fecha_creacion date not null,
	saldo money not null,
	constraint cuentas_pk primary key(numero_cuenta)
)



--Consultas cuentas

select numero_cuenta,saldo from cuentas   
select * from cuentas where fecha_creacion between'20/07/2023' and '20/09/2023'
select numero_cuenta,saldo from cuentas where fecha_creacion between '20/07/2023'and'20/09/2023'



--Tabla estudiantes
Create table estudiantes( 
	cedula char (10) not null,
	nombre varchar (50) not null,
	apellido varchar (50) not null,
	email varchar (50) not null,
	fecha_nacimiento date not null,
	constraint estudiantes_pk primary key(cedula)
)


select * from estudiantes
--Consultas estudiantes
select nombre, cedula from estudiantes 
select nombre from estudiantes where cedula like'17%'
select nombre,apellido from estudiantes where nombre like 'A%'




--REGISTROS_ENTRADA
create table registros_entrada(
	codigo_registro int not null,
	cedula_empleado char(10) not null,
	fecha date not null,
	hora time not null,
	constraint codigo_registro_pk primary key(codigo_registro)
)



--Consultas registros

select cedula_empleado,fecha,hora from registros_entrada
select * from registros_entrada where hora between '7:00' and '14:00'
select * from registros_entrada where hora > '8:00'


--VIDEOJUEGOS
create table videojuegos(
	codigo int not null,
	nombre varchar(100) not null,
	descripcion varchar(300),
	valoracion int not null,
	constraint codigo_videojuego_pk primary key(codigo)
)


--Consultas Videojuegos
select * from videojuegos where nombre like'C%'
select * from videojuegos where valoracion between 9 and 10
select * from videojuegos where descripcion isnull


--Tabla transacciones

Create table transacciones(
codigo int not null, 
numero_cuenta char (5) not null,
monto money not null,
tipo char (1) not null,
fecha date,
hora time,
constraint transacciones_pk primary key (codigo)
)


--Consultas transacciones
SELECT * FROM transacciones where tipo = 'D'
SELECT * FROM transacciones where monto > money(200) and monto <= money(2000)
SELECT codigo,monto,tipo,fecha from transacciones where fecha notnull
