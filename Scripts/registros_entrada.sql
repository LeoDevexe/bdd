--Registros entrada

Create table registros_entrada(
	codigo_registro int not null,
	cedula_empleado varchar (50) not null,
	fecha date  not null,
	hora time not null,
	constraint registros_entrada_pk primary key (codigo_registro )
)
