--Update Productos
UPDATE productos
SET descripcion = 0
WHERE descripcion IS NULL;

--Update Cuentas
UPDATE cuentas
SET saldo = 10
WHERE cedula_propietario LIKE '17%';

--Update Estudiantes
UPDATE estudiantes
SET apellido = 'Hernandez'
WHERE cedula LIKE '17%';

--Update registro entradas
UPDATE registros_entrada
SET cedula = '0823456789'
WHERE MONTH(fecha) = 8;


--Update Videojuegos
UPDATE videojuegos
SET descripcion = 'Mejor puntuado'
WHERE valoracion > 9;


--Update Transacciones
UPDATE transacciones
SET Tipo = 'Transferencia'
WHERE monto > money(100) AND monto < money(500) 
    AND MONTH(fecha) = 9 
    AND HOUR(hora) >= 14 AND HOUR(hora) <= 20;

