--Inspeccionemos ahora nuestra tabla trading.members con un poco más de profundidad

-- P1: Mostrar solo las 5 primeras filas de la tabla trading.members
select * from trading.members m 
limit 5;

--P2: Ordene todas las filas de la tabla segun first_name en orden alfabético y muestre las 3 filas superiores
select * from trading.members m 
order by first_name asc  
limit 3;

--P3: ¿Qué registros trading.members son de la región de Estados Unidos?
select * from trading.members m 
where region = 'United States';

--P4: Seleccione solo las columnas member_id y first_name para miembros que no sean de Australia
select member_id, first_name from trading.members m 
where region != 'Australia';

--p5: Devuelve las regiones como valores únicos de la tabla y ordena la salida por orden alfabético inverso
select distinct region from trading.members m
order by region desc;   

--P6: ¿Cuántos mentores hay de Australia o Estados Unidos?   **** Se me ocurrieron 2 formas. Lei en algun lado que mas eficiente en rendimiento poner un 1 en vez de * (count(1))
select count(*) as cantidad from trading.members m
where region in ('United States','Australia');

select count(*) as cantidad from trading.members m
where region = 'United States' or region = 'Australia';

--P7 ¿Cuántos mentores no son de Australia o Estados Unidos?   *** Tener cuidado con el OR y AND, no es lo mismo que la pregunta anterior
select count(*) as cantidad from trading.members m
where region not in ('United States','Australia');

select count(*) as cantidad from trading.members m
where region != 'United States' and region != 'Australia';

--P8 ¿Cuántos mentores hay por región? Ordene la salida por regiones con la mayor cantidad de mentores y la menor
select region, count(*) as cantidad_mentor from trading.members m
group by region
order by cantidad_mentor desc;

--P9 ¿Cuántos mentores estadounidenses y no estadounidenses hay?
/*
 * Vi 2 formas de hacerlo, la primera es del autor en la cual, en una nueva columna asigna "Non US" si no es es de EEUU caso contrario deja el valor (United States).
 * Luego agrupa esa columna y cuenta los aciertos de cada una:  
 */
SELECT
  CASE
    WHEN region != 'United States' THEN 'Non US'
    ELSE region
  END AS mentor_region,
  COUNT(*) AS mentor_count
FROM trading.members
GROUP BY mentor_region
ORDER BY mentor_count DESC;
/*
 * Otra forma que vi es directamente contando por cada columna, ejemplo si el valor es igual a EEUU asigno 1, luego cuenta ambos.
 * La visualizacion entre los 2 metodos es distinta.   
 */
SELECT    
	COUNT(CASE WHEN region = 'United States' THEN 1 END) AS mentores_estadounidenses,
    COUNT(CASE WHEN region <> 'United States' THEN 1 END) AS mentores_no_estadounidenses
FROM trading.members;


--P10: ¿Cuántos mentores tienen un nombre que comienza con una letra menor a 'E'? *** Con "menor" se refiere alfabeticamente menor 
select count(*) from trading.members m
where left (first_name,1) < 'E';



/*
 * OBSERVACIONES
 * Ademas de Left esta Right, ambos extraen la cantidad de letras que se especifique en el segundo parametro
 */
select right ('Hola Mundo',5);




