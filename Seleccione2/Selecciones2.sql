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
select * from productos where stock = 10 and precio < money(10)
select nombre,stock from productos  where nombre like '%m%' or descripcion=''
select * from productos  where descripcion isnull or descripcion='0'


--Tabla cuentas
create table cuentas(
	numero_cuenta char(5) not null,
	cedula_propietario char(5) not null,
	fecha_creacion date not null,
	saldo money not null,
	constraint cuentas_pk primary key(numero_cuenta)
)



--Consultas cuentas

select numero_cuenta,saldo from cuentas where saldo > money(100) and saldo < money(1000)   
select * from cuentas where fecha_creacion between'21/09/2022' and '21/09/2023'
select * from cuentas where saldo = money(0) or cedula_propietario like'%2'



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
select nombre, apellido from estudiantes where nombre like 'M%' or apellido like '%Z'
select nombre,apellido from estudiantes where cedula like'%32%' and cedula like'%18'
select nombre,apellido from estudiantes where cedula like '%06' or cedula like '17%'



--REGISTROS_ENTRADA
create table registros_entrada(
	codigo_registro int not null,
	cedula_empleado char(10) not null,
	fecha date not null,
	hora time not null,
	constraint codigo_registro_pk primary key(codigo_registro)
)



--Consultas registros

select * from registros_entrada where fecha between '01/09/2023' and '30/09/2023' or cedula_empleado like '17%'
select * from registros_entrada where fecha between '01/08/2023' and '31/08/2023' or cedula_empleado like '17%' and hora between '08:00' and '12:00'
select * from registros_entrada where fecha between '01/08/2023' and '31/08/2023' or cedula_empleado like '17%' and hora between '08:00' and '12:00'
or fecha between '01/09/2023' and '30/09/2023' and cedula_empleado like '08%' and hora between '09:00' and '13:00'

--VIDEOJUEGOS
create table videojuegos(
	codigo int not null,
	nombre varchar(100) not null,
	descripcion varchar(300),
	valoracion int not null,
	constraint codigo_videojuego_pk primary key(codigo)
)


--Consultas Videojuegos
select * from videojuegos where nombre like'%C%' or valoracion=7
select * from videojuegos where codigo between 3 and 7 or valoracion=7
select * from videojuegos where descripcion='Guerra' and valoracion > 7 and nombre like'C%' or valoracion > 8 and nombre like'D%' 


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
Select * from transacciones where tipo='C' and numero_Cuenta between '22001' and '22004'
select * from transacioones where tipo='D' and fecha='25/05/2023' and numero_cuenta between '22007' and '22010'
select * from transacciones where codigo between 1 and 5 and numero_cuenta between '22002' and'22004' and fecha between '26/05/2023' and '29/05/2023'


