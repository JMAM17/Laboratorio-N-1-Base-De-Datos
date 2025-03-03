--LECCION 102 DE SQL
--EJERCICIO 1 
--Se le ha proporcionado una tabla de productos que contiene datos sobre diferentes productos de la nube de Microsoft Azure.
--Imprima todos los datos en todas las columnas.
Solucion:
SELECT * FROM products product_id, product_category, product_name;

--LECCION 103 DE FROM
--EJERCICIO 2 
--Dada la tabla de reseñas, escriba una consulta para recuperar todas las reseñas de 3 estrellas mediante la cláusula WHERE de SQL. Solo muestre las columnas user_id y stars
Solucion:
SELECT user_id, stars FROM reviews WHERE stars = 3;

--LECCION 104 DE WHERE
--EJERCICIO 3 
-- Practiquemos el uso de AND junto con WHERE para filtrar las reseñas de Amazon en función de estas 4 condiciones:
-- *la reseña debe tener 4 o más estrellas
-- *el ID de la reseña es menor a 6000
-- *el ID de la reseña es mayor a 2000
-- *la reseña no puede provenir del usuario 142
Solucion:
SELECT * FROM reviews WHERE stars >= 4 AND review_id > 2000 AND review_id < 6000 AND user_id != 142;

--LECCION 104 DE AND, OR
--EJERCICIO 4  
--Practiquemos el uso de AND junto con WHERE para filtrar las reseñas de Amazon en función de estas dos condiciones:
-- *el recuento inicial es mayor que 2 y menor o igual que 4
-- *la reseña debe provenir del usuario 123, 265 o 362
Solucion:
SELECT * FROM reviews WHERE stars > 2 AND stars <= 4 AND user_id IN (123, 265, 362);

--LECION 105 DE BETWEEN
--EJERCICIO 5
--Imagina que eres un analista de datos que trabaja en CVS Pharmacy y tienes acceso a los datos de ventas de la farmacia. Utiliza el comando SQL BETWEEN para buscar datos sobre medicamentos:

-- *que se vendieron entre 100 000 y 105 000 unidades
-- *Y que fueron fabricados por Biogen, AbbVie o Eli Lilly
-- *Indica el nombre del fabricante, el nombre del medicamento y la cantidad de unidades vendidas.

-- "Sugerencia: este problema no solo requiere BETWEEN, sino también cláusulas OR, AND y WHERE". 
Solucion:
SELECT manufacturer, drug, units_sold FROM pharmacy_sales WHERE (manufacturer = 'AbbVie' OR manufacturer = 'Biogen' OR manufacturer = 'Eli Lilly') AND units_sold BETWEEN 100000 AND 105000;

--LECION 106 DE IN
--EJERCICIO 6
--Imagina que eres un analista de datos que trabaja en CVS Pharmacy y tienes acceso a los datos de ventas de la farmacia. Utiliza el comando IN SQL para buscar datos sobre medicamentos:

-- *que fueron fabricados por Roche, Bayer o AstraZeneca
-- *y no vendieron entre 55 000 y 550 000 unidades
-- *Muestra el nombre del fabricante, el nombre del medicamento y la cantidad de unidades vendidas para todos los medicamentos que coinciden con ese criterio.

-- Sugerencia: ¡no te olvides del operador BETWEEN!
Solución:
SELECT manufacturer, drug, units_sold FROM pharmacy_sales WHERE manufacturer IN('Roche','Bayer','AstraZeneca') AND units_sold NOT BETWEEN 55000 AND 550000;

--LECION 107 DE LIKE
--EJERCICIO 7
--Tiene una tabla de 1000 registros de clientes de una pequeña empresa con sede en Australia.
--Busque todos los clientes cuyo nombre comience con "F" y la última letra de su apellido sea "ck".
Solución:
SELECT *FROM customers WHERE customer_name LIKE 'F%ck';

--EJERCICIO 8
--Tiene una tabla de 1000 registros de clientes de una pequeña empresa con sede en Australia.
--Encuentre todos los clientes cuyo nombre tenga como segunda y tercera letra "e".
Solución:
SELECT * FROM customers WHERE customer_name LIKE '_ee%';

--LECCION 108 DE FILTERING REVIEW
--EJERCICIO 9
--Encuentre todos los clientes que tengan entre 18 y 22 años (inclusive), vivan en Victoria, Tasmania o Queensland, su género no sea "n/a" y su nombre comience con "A" o "B".
Solución:
SELECT * FROM customers WHERE age BETWEEN 18 AND 22 AND state IN ('Victoria', 'Tasmania', 'Queensland') AND gender != 'n/a'  AND (customer_name LIKE 'a%' OR customer_name LIKE 'b%');;

--LECCION 109 DE ORDER BY
--EJERCICIO 10
-- NO HAY

--LECCION 201 DE INTERMEDIATE SQL
--EJERCICIO 11
-- NO HAY

--LECCION 202  DE SUM, AVG, COUNT
--EJERCICIO 12
--Muestra el número de filas de la tabla pharmacy_sales.
Solución:
SELECT COUNT(*) FROM pharmacy_sales;

--EJERCICIO 13
--Imagina que eres un analista de datos que trabaja en una farmacia CVS y tienes acceso a los datos de ventas de la farmacia.
--Genera el número total de medicamentos fabricados por Pfizer y las ventas totales de todos los medicamentos de Pfizer.
Solución:
SELECT COUNT(manufacturer), SUM(total_sales) FROM pharmacy_sales WHERE manufacturer='Pfizer';

--EJERCICIO 14
--Escriba una consulta SQL usando AVG para encontrar el precio de apertura promedio de las acciones de Google (cuyo símbolo bursátil es 'GOOG').
Solución:
SELECT AVG(open) FROM stock_prices WHERE ticker='GOOG';

--EJERCICIO 15
--Utilice el comando MIN de SQL en este ejercicio práctico para encontrar el precio más bajo de las acciones de Microsoft (MSFT) jamás abiertas.
Solución:
SELECT MIN(open) FROM stock_prices WHERE ticker='MSFT';

--EJERCICIO 16
--Utilice el comando MAX de SQL en este ejercicio práctico para encontrar el precio más alto de las acciones de Netflix (NFLX) jamás abiertas.
Solución:
SELECT MAX(open) FROM stock_prices WHERE ticker='NFLX';

--LECCION 203  DE GROUP BY
--EJERCICIO 17
--Para cada acción de FAANG en el conjunto de datos stock_prices, escriba una consulta SQL para encontrar el precio más bajo al que se abrió cada acción. Asegúrese de ordenar también los resultados por precio, en orden descendente.
Solución:
SELECT ticker,MIN(open) FROM stock_prices GROUP BY ticker ORDER BY MIN(open) DESC

--EJERCICIO 18
--Este ejercicio de GROUP BY de SQL utiliza datos reales de una pregunta de entrevista de SQL de LinkedIn que es un poco difícil de abordar en este momento, por lo que resolveremos una variante más fácil de la pregunta de la entrevista.
--Supongamos que le dan una tabla de candidatos y sus habilidades. ¿Cuántos candidatos poseen cada una de las diferentes habilidades? Ordene sus respuestas en función de la cantidad de candidatos, de mayor a menor.
Solución:
SELECT skill,COUNT(candidate_id) FROM candidates GROUP BY skill ORDER BY COUNT(candidate_id) DESC;

--LECCION 204 DE SQL HAVING
--EJERCICIO 19
--Utilice los comandos HAVING y MIN de SQL para encontrar todas las acciones de FAANG cuyo precio de acción abierta siempre fue mayor a $100.
Solución:
SELECT ticker,MIN(open) FROM stock_prices GROUP BY ticker HAVING MIN(open)>100;

--EJERCICIO 20
--Dada una tabla de candidatos y sus habilidades técnicas, enumere los identificadores de candidatos que tengan más de 2 habilidades técnicas.
Solución:
SELECT candidate_id FROM candidates GROUP BY candidate_id HAVING COUNT(skill)>2;

--LECCION 205 DE SQL DISTINCT 
--EJERCICIO 21
--Supongamos que se le proporciona una tabla que contiene datos sobre los clientes de Amazon y sus gastos en productos de diferentes categorías. Escriba una consulta utilizando COUNT DISTINCT para identificar la cantidad de productos únicos dentro de cada categoría de producto.
Solución:
SELECT category, COUNT(DISTINCT product) FROM product_spend GROUP BY category;

--LECCION 206 DE SQL ARITHMETIC
--EJERCICIO 22
--CVS Health está intentando comprender mejor las ventas de sus farmacias y qué tan bien se venden los distintos productos. Cada medicamento solo puede ser producido por un fabricante.
--Redacte una consulta para encontrar los 3 medicamentos más rentables vendidos y cuántas ganancias obtuvieron. Suponga que no hay empates en las ganancias. Muestre el resultado desde la ganancia total más alta hasta la más baja.
Solución:
SELECT drug, total_sales-cogs AS total_profit FROM pharmacy_sales GROUP BY drug,total_profit ORDER BY total_profit DESC LIMIT 3

--EJERCICIO 23
--Su equipo en JPMorgan Chase se está preparando para lanzar una nueva tarjeta de crédito y, para obtener más información, está analizando cuántas tarjetas de crédito se emitieron cada mes.
--Redacte una consulta que muestre el nombre de cada tarjeta de crédito y la diferencia en la cantidad de tarjetas emitidas entre el mes con la mayor cantidad de tarjetas emitidas y el mes con la menor cantidad de tarjetas emitidas. Organice los resultados en función de la mayor disparidad.
Solució:
SELECT card_name, MAX(issued_amount)-MIN(issued_amount) AS difference FROM monthly_cards_issued GROUP BY card_name ORDER BY difference DESC;

--EJERCICIO 24
--Muestra las acciones que tuvieron "meses de grandes movimientos" y cuántos de esos meses tuvieron. Ordena tus resultados desde las acciones con más, hasta las que tuvieron menos, "meses de grandes movimientos".
Solución:
SELECT ticker, COUNT(ticker) FROM stock_prices WHERE ((close - open)*100)/open > 10 OR ((close - open)*100)/open < -10 GROUP BY ticker ORDER BY count DESC;

--LECCION 207 DE SQL MATH FUNCTIONS
--EJERCICIO 25
--Imagina que eres un analista de datos que trabaja en una farmacia CVS y tienes acceso a los datos de ventas de la farmacia.
--Para todos los medicamentos de Merck, genera el nombre del medicamento y el costo unitario de cada uno, redondeado al dólar más cercano. Ordénalo desde el medicamento más barato hasta el más caro.
Solución:
SELECT drug, CEIL(total_sales/units_sold) AS unit_cost FROM pharmacy_sales WHERE manufacturer = 'Merck' ORDER BY unit_cost;

--LECCION 208 DE SQL DIVISION
--EJERCICIO 26
--EJERCICIO NO DA (EL EJERCICIO FUNCIONA CON UNA SUBSCRIPCION).


--LECCION 209 DE SQL NULL
--EJERCICIO 27
--Tesla está investigando los cuellos de botella de la producción y necesita tu ayuda para extraer los datos pertinentes. Escribe una consulta para determinar qué piezas han comenzado el proceso de ensamblaje pero aún no están terminadas.
Solución:
SELECT part, assembly_step FROM parts_assembly WHERE finish_date IS NULL;

--LECCION 210 DE SQL CASE
--EJERCICIO 28
--Explora el conjunto de datos de Marvel Avengers y escribe una consulta para categorizar a los superhéroes según sus me gusta promedio de la siguiente manera:
--Super me gusta: los superhéroes con un recuento de me gusta promedio mayor o igual a 15 000.
--Buenos me gusta: los superhéroes con un recuento de me gusta promedio entre 5000 y 14 999 (inclusive).
--Poco me gusta: los superhéroes con un recuento de me gusta promedio menor a 5000.
--Muestra el nombre del actor y el personaje, la plataforma, el promedio de me gusta y la categoría de me gusta correspondiente. Ordena los resultados por promedio de me gusta.
Solución:
SELECT actor,character,platform, avg_likes, CASE WHEN avg_likes >= 15000 THEN 'Super Likes' WHEN avg_likes BETWEEN 5000 AND 14999 THEN 'Good Likes' ELSE 'Low Likes'END AS likes_category FROM marvel_avengers ORDER BY avg_likes DESC;

--EJERCICIO 29
--Esta es la misma pregunta que el problema n.° 3 del capítulo SQL de Ace the Data Science Interview. 
--Suponga que le dan la tabla sobre la audiencia de los usuarios categorizada por tipo de dispositivo, donde los tres tipos son computadora portátil, tableta y teléfono. 
--Escriba una consulta que calcule la audiencia total de computadoras portátiles y dispositivos móviles, donde "móvil" se define como la suma de la audiencia de tabletas y teléfonos. Genere la audiencia total de computadoras portátiles como laptop_reviews y la audiencia total de dispositivos móviles como mobile_views.
Solución:
SELECT COUNT(CASE WHEN device_type='laptop' THEN 1 ELSE NULL END) AS laptop_views,COUNT(CASE WHEN device_type IN('tablet','phone') THEN 1 ELSE NULL END) AS mobile_views FROM viewership;

--LECCION 211  DE SQL JOINS
--EJERCICIO 30
--Supongamos que le han proporcionado las tablas que contienen información sobre los usuarios de Robinhood y las transacciones bursátiles que realizaron.
--Use una operación JOIN para generar toda la información de la tabla de transacciones unida a la tabla de usuarios.
Solución:
SELECT * FROM trades JOIN users ON trades.user_id = users.user_id;

--EJERCICIO 31
--¡Esta es la misma pregunta que el problema n.° 2 del capítulo SQL de Ace the Data Science Interview!
--Suponga que le proporcionan las tablas que contienen las órdenes de comercio completadas y los detalles de los usuarios en un sistema de comercio Robinhood.
--Escriba una consulta para recuperar las tres ciudades principales que tienen la mayor cantidad de órdenes de comercio completadas enumeradas en orden descendente. Imprima el nombre de la ciudad y la cantidad correspondiente de órdenes de comercio completadas.
Solución:
SELECT  city, COUNT(order_id) FROM trades JOIN users ON trades.user_id = users.user_id WHERE status = 'Completed' GROUP BY city ORDER BY COUNT(order_id) DESC LIMIT 3

--EJERCICIO 32
--Supongamos que se le proporcionan dos tablas que contienen datos sobre las páginas de Facebook y sus respectivos "Me gusta" (como en "Me gusta una página de Facebook").
--Escriba una consulta para devolver los identificadores de las páginas de Facebook que tienen cero "Me gusta". El resultado debe ordenarse en orden ascendente según los identificadores de las páginas.
Solución:
SELECT page_id FROM pages WHERE page_id NOT IN (SELECT DISTINCT(page_id) FROM page_likes);

--LECCION 212  DE SQL Date-Time Functions
--EJERCICIO 33
--Dada una tabla de publicaciones de Facebook, para cada usuario que publicó al menos dos veces en 2021, escribe una consulta para encontrar la cantidad de días entre la primera publicación del año y la última publicación del año de cada usuario en el año 2021. Genera el usuario y la cantidad de días entre la primera y la última publicación de cada usuario.
--P.d.: Si has leído la entrevista Ace the Data Science y te gustó, ¿consideras escribirnos una reseña?
Solución:
SELECT user_id,EXTRACT(DAYS FROM (MAX(post_date) - MIN(post_date))) AS days_between FROM posts WHERE EXTRACT(YEAR FROM post_date) = '2021' GROUP BY 1 HAVING COUNT(post_id) > 1 ORDER BY user_id;

--EJERCICIO 34
--Supongamos que se le proporcionan tablas con información sobre los registros y confirmaciones de usuarios de TikTok a través de correo electrónico y mensajes de texto. Los nuevos usuarios de TikTok se registran con sus direcciones de correo electrónico y, al registrarse, cada usuario recibe un mensaje de texto de confirmación para activar su cuenta.
--Escriba una consulta para mostrar los ID de usuario de aquellos que no confirmaron su registro el primer día, pero sí lo hicieron el segundo día.
Solución:
SELECT DISTINCT user_id FROM emails INNER JOIN texts ON emails.email_id = texts.email_id WHERE texts.action_date = emails.signup_date + INTERVAL '1 day'AND texts.signup_action = 'Confirmed';

--EJERCICIO 35
--Dada una tabla de publicaciones de Facebook, para cada usuario que publicó al menos dos veces en 2021, escriba una consulta para encontrar la cantidad de días entre la primera publicación del año y la última publicación del año de cada usuario en el año 2021. Genere el usuario y la cantidad de días entre la primera y la última publicación de cada usuario.
Solucion:
SELECT user_id,EXTRACT(DAYS FROM (MAX(post_date) - MIN(post_date))) AS days_between FROM posts WHERE EXTRACT(YEAR FROM post_date) = '2021'GROUP BY user_id HAVING COUNT(post_id) > 1 ORDER BY user_id;


