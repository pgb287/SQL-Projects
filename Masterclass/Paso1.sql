/*
Para todo este curso de SQL, nos centraremos en nuestro estudio de caso de SQL sobre comercio de criptomonedas.
Todos los datos residen en una base de datos PostgreSQL y contienen un unico esquema llamado 'trading'.
Hay 3 tablas de datos disponibles para nosotros en este esquema que podemos usar para ejecutar nuestras consultas SQL con:
-members
-prices
-transactions
Recoradr que es necesario anteponer el esquema antes de nombrar tablas, por ejemplo:
select * from trading.members;
En escenarios realistas, las tablas físicas casi siempre estarán dentro de un esquema y necesitaremos hacer referencia al nombre del esquema para ejecutar nuestras consultas correctamente.  
 */

-- Seleccionar todos los miembros
select * from trading.members m 

