-- Seleccionar todos los campos de la tabla
-- SELECT nombre_columna, nombre_columna2, ... FROM nombre_tabla

SELECT * FROM actor; -- * para todas las columnas

SELECT first_name, last_name, email FROM customer;

-- Seleccionar 10 registros de la tabla films
-- SELECT nombre_columna, ... FROM nombre_ tabla LIMIT numero_registros

SELECT * FROM film LIMIT 10;

SELECT * FROM payment LIMIT 5;

-- Seleccionar los 5 primeros registros despues de los primeros 100 registros
-- SELECT calumnas FROM nombre_tabla LIMIT numero_cuantos OFFSET numero_despues
SELECT * FROM customer LIMIT 5 OFFSET 100;

--SELECT CONDICIONAL
-- Seleccionar todos los campos de la tambla clientes que se llamen Jhon
-- SELECT columnas FROM nombre_tabla WHERE condicion

SELECT * FROM customer WHERE first_name = 'John';

SELECT * FROM customer WHERE customer_id = 1;

-- si no conocemos el valor exacto  para el nombre del cliente: LOWER, UPPER
SELECT * FROM customer WHERE LOWER(first_name) = 'jhon';
SELECT * FROM customer WHERE UPPER(first_name) = 'JOHN';

-- Si deseo consultar un dato pero no se su valor exacto
--LIKE junto con los signos % y _
-- % : zero a muchos caracteres y _: un unico caracter
SELECT * FROM customer WHERE last_name LIKE 'Farns%';
SELECT * FROM customer WHERE last_name LIKE 'Ma____';
SELECT * FROM customer WHERE last_name LIKE '%tox';

-- Seleccionar todos los campos de peliculas que tengas un rating de PG o G.
SELECT *FROM film WHERE rating = 'PG' OR rating ='G';

-- Buscar valores especificas
-- SELECT columnas FROM nombre_table WHERE nombre_columna IN (VALOR1,VALOR2, )
SELECT * FROM film WHERE rating IN ('PG', 'G');

SELECT title FROM film WHERE LOWER(title) IN ('alice fantasia', 'blade polish'); 

-- Buscar las peliculas con el id de 1 a 10
-- SELECT columnas FROM nombre_tabla WHERE nombre_columna BETWEEN numero AND numero;
SELECT * FROM film WHERE film_id BETWEEN 1 AND 10;

SELECT * FROM film WHERE film_id >= 1 AND film_id <= 10;

-- Buscar valores nulos o vacios
-- SELECT columnas  FROM nombre_table WHERE nombre_columna IS NULL;
-- Selecionar todos los campos de la tabla direcciones DONDE direccion 2 sea NULL
SELECT * FROM address WHERE address2 IS NULL;

-- Selecionar todos los campos de la tabla direcciones donde direccion 2 sea vacio
SELECT * FROM address WHERE address2 = '';

-- ORDER LOS REGISTROS
-- SELECT columnas FROM nombre_table
-- WHERE condicional (opcional)
-- ORDER BY columna(s)
-- DESC (opcional)
-- Seleccionar todos los campos de películas (film) y ordenarlos por su id.
SELECT * FROM film
ORDER BY film_id;
-- Seleccionar customer_id y rental_id de rental y 
-- ordenarlos por customer_id y luego por rental_id
SELECT customer_id, rental_id FROM rental
ORDER BY customer_id, rental_id; -- el orden importa

-- puedo ordenar por
SELECT * FROM film
ORDER BY title;

--------------------------
--Selecionar la cantidad mas pequeña de la tabla payments
-- SELET MIN(columna) FROM nombre_tabla WHERE condicion (OPCIONAL)
SELECT MIN (amount) FROM payment;
SELECT * FROM payment;

-- Actualizar para el pago 17503 la cantidad a -5
UPDATE payment SET amount = -5 WHERE payment_id = 17503;

--Seleccionar la cantidad mas grande de la tabla pagos, pero con un tope maximo (< 7)
--SELECT MAX(columna) FROM nombre_tabla WHRE 
SELECT MAX (amount) FROM payment WHERE amount < 7;

SELECT *FROM payment ORDER BY payment_date;

--Seleccionar cuantos clientes tenemos
--SELECT COUNT* FROM nombre_tabla WHERE condicion(opcional)
SELECT COUNT(*) FROM customer;
SELECT COUNT(customer_id) FROM customer;

--Seleccionar CUANTOS codigos postales tenemos difernetes en nuestra tabla de direcciones 
SELECT COUNT(postal_code) FROM address;
SELECT COUNT(DISTINCT postal_code) FROM address;

-- Seleccionar CUANTAS peliculas clasificacion(rating) PG, PG-13, NC-17 TENEMOS?
-- SELECT OPERACION(* O columna) FROM nombre_tabla WHERE condicion (opc) GROUP BY nombre_columba
SELECT rating AS clasificacion, COUNT(rating) FROM film WHERE rating IN ('PG', 'PG-13', 'NC-17') GROUP BY rating;

-- Seleccionar CUAL es el gasto promedio de cada cliente?
SELECT * FROM payment;
-- Selccionar AVG(columna) FROM nombre_tabla WHERE condicion(opc) GROUP BU columna
SELECT AVG(amount), customer_id FROM payment GROUP BY customer_id;


SELECT AVG(amount), customer_id FROM payment GROUP BY customer_id; 

--EJERCICIOS 
-- Obtén una lista de actores con el nombre Julia.
SELECT * FROM actor WHERE first_name = 'Julia';

-- Obtén una lista de actores con los nombres Chris, Cameron o Cuba.
SELECT * FROM actor WHERE LOWER(first_name) in ('chris', 'cameron','cuba') ORDER BY first_name
; 
-- Selecciona la fila de la tabla customer para el cliente con el nombre Jamie Rice.
SELECT * FROM customer WHERE LOWER (first_name) = 'jaime' AND LOWER(last_name) = 'rice';

-- Selecciona el monto y la fecha de pago de la tabla payment donde el monto pagado sea menor a $1.
SELECT amount, payment_date FROM payment WHERE amount < 1 ORDER BY payment_date;

-- ¿Cuáles son los ID de los últimos 3 clientes que devolvieron un alquiler?
SELECT customer_id, return_date FROM rental ORDER BY return_date LIMIT 3;

--¿Cuántas películas tienen clasificación NC-17?
--¿Cuántas tienen clasificación PG o PG-13?
SELECT rating, COUNT(rating) FROM film WHERE rating IN ('NC-17', 'PG', 'PG-13') GROUP BY rating;

--¿Cuántos clientes diferentes tienen registros en la tabla rental?
SELECT COUNT(DISTINCT customer_id) FROM rental;

--¿Hay algún cliente con el mismo apellido?
SELECT * FROM customer;
SELECT * FROM customer WHERE customer IN ('last_name');

--Cuenta el número de ciudades para cada country_id en la tabla city. Ordena los resultados por count(*).
SELECT country_id, COUNT(*) AS city_number FROM city GROUP BY country_id ORDER BY city_number;
