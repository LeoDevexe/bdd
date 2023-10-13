--Para la relación muchos a muchos entre usuarios y grupo:
--Consulta:
SELECT usuarios.nombre, grupo.nombre
FROM usuarios, grupo, usuario_grupo
WHERE usuarios.id = usuario_grupo.us_id
AND grupo.id = usuario_grupo.gr_id;

--Subconsulta:
SELECT nombre
FROM usuarios
WHERE id IN (SELECT us_id FROM usuario_grupo WHERE gr_id = 1);

--Función de agregación:
SELECT grupo.nombre, COUNT(usuario_grupo.us_id) AS cantidad_usuarios
FROM grupo, usuario_grupo
WHERE grupo.id = usuario_grupo.gr_id
GROUP BY grupo.nombre;

--Consulta 2:
SELECT usuarios.nombre,grupo.nombre
FROM usuarios, grupo, usuario_grupo
WHERE usuarios.id = usuario_grupo.us_id
AND grupo.id = usuario_grupo.gr_id
AND grupo.nombre LIKE '%intensivo%';

--Subconsulta 2:
SELECT nombre
FROM usuarios
WHERE id IN (SELECT us_id FROM usuario_grupo WHERE gr_id = 2);

--Función de agregación 2:
SELECT grupo.nombre, MAX(usuario_grupo.us_id) AS max_usuarios
FROM grupo, usuario_grupo
WHERE grupo.id = usuario_grupo.gr_id
GROUP BY grupo.nombre;


SELECT grupo.nombre, MIN(usuario_grupo.us_id) AS min_usuarios
FROM grupo, usuario_grupo
WHERE grupo.id = usuario_grupo.gr_id
GROUP BY grupo.nombre;


--Consulta 3:

SELECT usuarios.nombre, grupo.fecha_creacion
FROM usuarios, grupo, usuario_grupo
WHERE usuarios.id = usuario_grupo.us_id
AND grupo.id = usuario_grupo.gr_id
AND grupo.fecha_creacion Between '2020-03-08' and '2022-03-08'



--Subconsulta 3:
SELECT nombre
FROM usuarios
WHERE id IN (SELECT us_id FROM usuario_grupo WHERE gr_id = 3);

--Función de agregación 3:
SELECT grupo.descripcion, COUNT(usuario_grupo.us_id) AS cantidad_usuarios
FROM grupo, usuario_grupo
WHERE grupo.id = usuario_grupo.gr_id
AND grupo.descripcion LIKE '%matutino%'
GROUP BY grupo.descripcion;




--------------------------------------********************************************-----------------------

--Para la relación muchos a muchos entre habitaciones y huéspedes:

--Consulta:
SELECT habitaciones.habitacion_numero, huespedes.nombres, huespedes.apellidos
FROM habitaciones, huespedes, reservas
WHERE habitaciones.habitacion_numero = reservas.habitacion
AND huespedes.id = reservas.huesped_id;

--Subconsulta:
SELECT nombres, apellidos
FROM huespedes
WHERE id IN (SELECT huesped_id FROM reservas WHERE habitacion = 2);

--Función de agregación:
SELECT habitaciones.habitacion_numero, COUNT(reservas.huesped_id) AS cantidad_huespedes
FROM habitaciones, reservas
WHERE habitaciones.habitacion_numero = reservas.habitacion
GROUP BY habitaciones.habitacion_numero;

--Consulta 2:
SELECT habitaciones.habitacion_numero, habitaciones.piso, huespedes.nombres, huespedes.apellidos
FROM habitaciones, huespedes, reservas
WHERE habitaciones.piso = 4
AND habitaciones.habitacion_numero = reservas.habitacion
AND huespedes.id = reservas.huesped_id;



--Subconsulta 2:
SELECT nombres, apellidos
FROM huespedes
WHERE id IN (SELECT huesped_id FROM reservas WHERE habitacion = 3);

--Función de agregación 2:
SELECT habitaciones.habitacion_numero, ROUND(AVG(reservas.huesped_id)) AS promedio_huespedes
FROM habitaciones, reservas
WHERE habitaciones.habitacion_numero = reservas.habitacion
GROUP BY habitaciones.habitacion_numero;


--Consulta 3:
SELECT habitaciones.habitacion_numero, huespedes.nombres, huespedes.apellidos
FROM habitaciones, huespedes, reservas
WHERE habitaciones.habitacion_numero = reservas.habitacion
AND huespedes.id = reservas.huesped_id;

--Subconsulta 3:
SELECT nombres, apellidos
FROM huespedes
WHERE id IN (SELECT huesped_id FROM reservas WHERE habitacion = 4);

--Función de agregación 3:

SELECT habitaciones.habitacion_numero, SUM(habitaciones.precio_por_noch) AS total_recogido
FROM habitaciones, reservas
WHERE habitaciones.habitacion_numero = reservas.habitacion
GROUP BY habitaciones.habitacion_numero;





--------------------------------------********************************************-----------------------
--Para la relación muchos a muchos entre municipio y proyectos:

--Consulta:
SELECT municipio.nombre, proyecto.proyecto
FROM municipio, proyecto, proyecto_municipio
WHERE municipio.id = proyecto_municipio.municipio_id
AND proyecto.id = proyecto_municipio.proyecto_id;

--Subconsulta:
SELECT proyecto
FROM proyecto
WHERE id IN (SELECT proyecto_id FROM proyecto_municipio WHERE municipio_id = 1);

--Función de agregación:
SELECT municipio.nombre, COUNT(proyecto_municipio.proyecto_id) AS cantidad_proyectos
FROM municipio, proyecto_municipio
WHERE municipio.id = proyecto_municipio.municipio_id
GROUP BY municipio.nombre;

--Consulta 2:
SELECT municipio.nombre, proyecto.proyecto
FROM municipio, proyecto, proyecto_municipio
WHERE municipio.id = proyecto_municipio.municipio_id
AND proyecto.id = proyecto_municipio.proyecto_id
AND municipio.nombre LIKE'%GAD %';

--Subconsulta 2:
SELECT proyecto
FROM proyecto
WHERE id IN (SELECT proyecto_id FROM proyecto_municipio WHERE municipio_id = 2);

--Función de agregación 2:

SELECT municipio.nombre, ROUND(AVG(CAST(proyecto.monto AS numeric)),2) AS promedio_precios
FROM municipio, proyecto_municipio, proyecto
WHERE municipio.id = proyecto_municipio.municipio_id
AND proyecto.id = proyecto_municipio.proyecto_id
GROUP BY municipio.nombre;


--Consulta 3:
SELECT municipio.nombre, ciudad.nombre
FROM municipio, ciudad
WHERE municipio.ciudad_id = ciudad.id;



--Subconsulta 3:
SELECT proyecto
FROM proyecto
WHERE id IN (SELECT proyecto_id FROM proyecto_municipio WHERE municipio_id = 3);

--Función de agregación 3:
SELECT municipio.nombre, MAX(proyecto_municipio.proyecto_id) AS max_proyectos
FROM municipio, proyecto_municipio
WHERE municipio.id = proyecto_municipio.municipio_id
GROUP BY municipio.nombre;

--------------------------------------********************************************-----------------------




