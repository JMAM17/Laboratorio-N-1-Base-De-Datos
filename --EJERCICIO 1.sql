--EJERCICIO 1
--Dada la tabla de reseñas, escriba una consulta para recuperar todas las reseñas de 3 estrellas mediante la cláusula WHERE de SQL. Solo muestre las columnas user_id y stars
Solucion:
SELECT user_id, stars FROM reviews WHERE stars = 3;
--EJERCICIO 2
--Se le ha proporcionado una tabla de productos que contiene datos sobre diferentes productos de la nube de Microsoft Azure.
--Imprima todos los datos en todas las columnas.
Solucion:
SELECT * FROM products;
--EJERCICIO 3
-- Practiquemos el uso de AND junto con WHERE para filtrar las reseñas de Amazon en función de estas 4 condiciones:
-- *la reseña debe tener 4 o más estrellas
-- *el ID de la reseña es menor a 6000
-- *el ID de la reseña es mayor a 2000
-- *la reseña no puede provenir del usuario 142
Solucion:
SELECT * FROM reviews WHERE stars >= 4 AND review_id > 2000 AND review_id < 6000 AND user_id != 142;
--EJERCICIO 4
--Practiquemos el uso de AND junto con WHERE para filtrar las reseñas de Amazon en función de estas dos condiciones:
-- *el recuento inicial es mayor que 2 y menor o igual que 4
-- *la reseña debe provenir del usuario 123, 265 o 362
Solucion:
SELECT * FROM reviews WHERE stars > 2 AND stars <= 4 AND user_id IN (123, 265, 362);

