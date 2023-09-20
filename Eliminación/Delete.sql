DELETE FROM productos
WHERE descripcion IS NULL;
Eliminar todas las cuentas cuya "cedula_propietario" empiece por "10" en la tabla "cuentas":
sql
Copy code
DELETE FROM cuentas
WHERE cedula_propietario LIKE '10%';
Eliminar todos los estudiantes que tengan una cédula que termine en "05" en la tabla "estudiantes":
sql
--DELETE ESTUDIANTES
DELETE FROM estudiantes
WHERE cedula LIKE '%05';

--DELETE REGISTROS
DELETE FROM registro_entradas
WHERE fecha= 6;


--DELETE VIDEOJUEGOS
DELETE FROM videojuegos
WHERE valoracion < 7;

--DELETE TRANSACCIONES
DELETE FROM transacciones
DELETE FROM transacciones
WHERE EXTRACT(YEAR FROM fecha) = 2023
  AND EXTRACT(MONTH FROM fecha) = 8;
  AND hora >= 14:00
  AND hora <= 18:00;
