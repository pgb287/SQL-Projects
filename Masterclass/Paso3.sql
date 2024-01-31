/* 
 * Nuestro próximo conjunto de datos a explorar será la tabla trading.prices que contiene el precio diario y los datos de volumen de los 2 tickers de criptomonedas: ETH y BTC (Ethereum y Bitcoin)
 */
select * from trading.prices p
where ticker = 'BTC'  
limit 5;

-- P1: ¿Cuántos registros totales tenemos en la tabla trading.prices?
select count(*) as total_registros from trading.prices p

-- P2: ¿Cuántos registros hay por cada valor de ticker?
select ticker, count(*)
from trading.prices p
group by ticker;

-- P3: ¿Cuáles son los valores mínimo y máximo en market_date?
select min(market_date) as fecha_menor, max(market_date) as fecha_mayor   
from trading.prices;

-- P4: ¿Existen diferencias en los valores mínimo y máximo de market_date para cada ticker?
select ticker, min(market_date) as fecha_menor, max(market_date) as fecha_mayor   
from trading.prices
group by ticker;

-- P5: ¿Cuál es el promedio de la columna price en Bitcoin durante el año 2020?    
-- Yo lo hice asi (primero habia aplicado left pero me salia error porque no era cadena sino campo date)
select avg(price)  
from trading.prices p 
where ticker = 'BTC' and extract (year from market_date) = '2020';
-- El autor lo hizo asi:
SELECT
  AVG(price)
FROM trading.prices
WHERE ticker = 'BTC' AND market_date BETWEEN '2020-01-01' AND '2020-12-31';

-- P6: ¿Cuál es el promedio mensual de la columna price de Ethereum en 2020? Ordene la salida en orden cronológico y también redondee el valor del precio promedio a 2 decimales
select date_trunc('month',market_date) as meses, round(avg(price)::numeric,2)  
from trading.prices 
where ticker = 'ETH' and date_part('year',market_date) = '2020'
group by meses

/*
 * DATE_TRUNC Y DATE_PART
 * 
 * 'date_trunc' trunca una fecha o un intervalo de tiempo al inicio de una unidad de tiempo especificada. La unidad de tiempo puede ser 'year', 'quarter', 'month', 'week', 'day', 'hour', 'minute', 'second', entre otras.
 * Ejemplo: SELECT date_trunc('month', '2024-01-30'::date); devolverá '2024-01-01', truncando la fecha al inicio del mes.
 * 
 * 'date_part' extrae la parte específica de una fecha o un intervalo de tiempo. La unidad de tiempo puede ser 'year', 'quarter', 'month', 'week', 'day', 'hour', 'minute', 'second', entre otras.
 * Ejemplo: SELECT date_part('year', '2024-01-30'::date); devolverá 2024, extrayendo el año de la fecha.
 *
 * En PostgreSQL, :: se utiliza para realizar una conversión de tipo, y numeric es un tipo de dato que puede almacenar valores numéricos, incluyendo aquellos con decimales.
 * Cuando utilizas ::numeric después de la función ROUND, estás indicando explícitamente que deseas que el resultado sea de tipo numeric.
 * Esto puede ser necesario en algunas situaciones para evitar problemas de tipo, especialmente si estás usando la función en combinación con otros cálculos.
 *
 * */
 




