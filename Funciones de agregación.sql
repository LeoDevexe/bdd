--FUNCIONES DE AGREGACIÓN 
--RELACION UNO A Muchos CUENTAS CON usuario
--Función de agregación 1: Obtener el saldo promedio de todas las cuentas de un usuario específico.
SELECT SUM(saldo) / COUNT(*) AS saldo_promedio
FROM cuentas
WHERE cedula = '1659';


--Función de agregación 2: Obtener el número total de cuentas de cada tipo de cuenta.
SELECT tipo_cuenta, COUNT(*) AS total_cuentas
FROM usuario
GROUP BY tipo_cuenta;


----------------------------------
--RELACION CLIENTES COMPRAS
--Función de agregación 1: Obtener el monto total de compras realizadas por cada cliente.

SELECT cedula, SUM(monto) AS monto_total_compras
FROM compras
GROUP BY cedula;


SELECT * FROM compras
--función de agregación 2: Obtener la cantidad total de compras realizadas en una fecha específica.

SELECT fecha_compra, COUNT(*) AS total_compras
FROM compras
WHERE fecha_compra = '11/10/2023'
GROUP BY fecha_compra;


----------------------------------------
--RELACION ESTUDIANTES PROFESORES

--Función de agregación 1: Obtener la cantidad total de estudiantes asignados a cada profesor.

SELECT codigo_profesor, COUNT(*) AS total_estudiantes
FROM estudiantes
GROUP BY codigo_profesor;



----Función de agregación 2: Obtener la edad promedio de los estudiantes.

SELECT ROUND(AVG(EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM fecha_nacimiento))) AS edad_promedio
FROM estudiantes;


SELECT * FROM estudiantes
---------------------------

--RELACION PERSONA -PRESTAMO 


 --Función de agregación 1: Obtener la suma total de los montos de préstamos para cada persona.

SELECT cedula, SUM(monto) AS monto_total_prestamos
FROM prestamo
GROUP BY cedula;



 --Función de agregación 2: Obtener la cantidad total de personas que tienen más de un hijo.


SELECT COUNT(*) AS total_personas
FROM persona
WHERE numeros_hijos > 1;



--------------------------------------------

--RELACION PRODUCTOS CON VENTAS


  --Función de agregación 1: Obtener el máximo precio de todos los productos.



SELECT MAX(precio) AS precio_maximo
FROM productos;



---Función de agregación 2: Obtener la suma total de la cantidad de productos vendidos.


SELECT SUM(cantidad) AS cantidad_total_vendida
FROM ventas;


-----------------**************************-------

--RELACION TRANSACCIONES Y BANCO

--Función de agregación 1: Obtener la cantidad total de transacciones de tipo 'C' (crédito).


SELECT COUNT(*) AS total_transacciones_credito
FROM transacciones
WHERE tipo = 'C';

---Función de agregación 2: Obtener el promedio de montos de transacciones para cada número de cuenta.


SELECT numero_cuenta, ROUND(AVG(CAST(monto AS decimal)),2) AS monto_promedio
FROM transacciones
GROUP BY numero_cuenta;




SELECT *FROM banco
SELECT * FROM transacciones

--------------------------*****************------------------

--RELACION VIDEOJUEGOS Y PLATAFORMA


---Función de agregación 1: Obtener la cantidad total de plataformas disponibles para cada videojuego.



SELECT codigo_videojuego, COUNT(*) AS total_plataformas
FROM plataformas
GROUP BY codigo_videojuego;


--Función de agregación 2: Obtener el valoración promedio de todos los videojuegos.



SELECT ROUND(AVG(valoracion),2) AS valoracion_promedio
FROM videojuegos;

----Relación "registros_entrada" con "empleado":

 --Función de agregación 1: Obtener la cantidad total de registros de entrada realizados por cada empleado.

SELECT cedula_empleado, COUNT(*) AS total_registros_entrada
FROM registros_entrada
GROUP BY cedula_empleado;

--Función de agregación 2: Obtener la fecha mínima y máxima de los registros de entrada.

SELECT MIN(fecha) AS fecha_minima, MAX(fecha) AS fecha_maxima
FROM registros_entrada;


