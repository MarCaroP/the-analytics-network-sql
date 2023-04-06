/*
EJERCICIOS CON SQL SERVER
Clase 1:
Respuestas:
*/

use [SQL de cero a Messi];

-- 1 Mostrar todos los productos dentro de la categoria electro junto con todos los detalles.
select * from product_master
where categoria = 'electro';
-- 2 Cuales son los producto producidos en China?
select * from product_master
where origen like 'china'
-- 3 Mostrar todos los productos de Electro ordenados por nombre.
select * from product_master
where categoria like 'Electro'
order by nombre;
-- 4 Cuales son las TV que se encuentran activas para la venta?
select * from product_master
where subcategoria like 'tv' and is_active =1
-- 5 Mostrar todas las tiendas de Argentina ordenadas por fecha de apertura de las mas antigua a la mas nueva.
select * from store_master sm
where sm.pais like 'Argentina' and fecha_apertura is not null
order by fecha_apertura;
-- 6 Cuales fueron las ultimas 5 ordenes de ventas?
select  top 5 * from order_line_sale
order by fecha desc
-- 7 Mostrar los primeros 10 registros de el conteo de trafico por Super store ordenados por fecha.
select top 10 * from super_store_count
order by fecha;
-- 8 Cuales son los producto de electro que no son Soporte de TV ni control remoto.
select * from product_master
where subsubcategoria not like 'Soporte%' 
AND subsubcategoria not like'Control%';

select * from product_master
where subsubcategoria not in ('Soporte','Control remoto');

-- 9 Mostrar todas las lineas de venta donde el monto sea mayor a $100.000 solo para transacciones en pesos.
select * from order_line_sale ol
where ol.venta>100000 and ol.moneda='ARS'
-- 10 Mostrar todas las lineas de ventas de Octubre 2022.
select * from order_line_sale ol
where year(ol.fecha)=2022 and MONTH(ol.fecha)=10

select * from order_line_sale ol
where ol.fecha between '2022-10-01' and '2022-10-30'
-- 11 Mostrar todos los productos que tengan EAN.
select * from product_master pm
where pm.ean is not null
-- 12 Mostrar todas las lineas de venta que que hayan sido vendidas entre 1 de Octubre de 2022 y 10 de Noviembre de 2022.
select * from order_line_sale ol
where ol.fecha between '2022-10-01' and '2022-11-10'



/*
Clase 2
Respuestas:
*/


-- 1 Cuales son los paises donde la empresa tiene tiendas?
 select distinct sm.pais from store_master sm

-- 2 Cuantos productos por subcategoria tiene disponible para la venta?

select subcategoria, count(*) from product_master pm
where pm.is_active=1
group by subcategoria

-- 3 Cuales son las ordenes de venta de Argentina de mayor a $100.000?

select * from order_line_sale o
where o.venta>100000 and moneda='ARS'

-- 4 Obtener los descuentos otorgados durante Noviembre de 2022 en cada una de las monedas?
select moneda, sum(descuento) from order_line_sale o
where o.fecha between '20221101' and '20221201'
group by moneda

-- 5 Obtener los impuestos pagados en Europa durante el 2022.
select moneda, sum(o.impuestos) from order_line_sale o
where year(o.fecha)=2022 and o.moneda='EUR'
group by moneda

-- 6 En cuantas ordenes se utilizaron creditos?
select count(*) from order_line_sale o 
where o.creditos is not null
-- 7 Cual es el % de descuentos otorgados (sobre las ventas) por tienda?
select * from 
-- 8 Cual es el inventario promedio por dia que tiene cada tienda?
-- 9 Obtener las ventas netas y el porcentaje de descuento otorgado por producto en Argentina.
-- 10 Las tablas "market_count" y "super_store_count" representan dos sistemas distintos que usa la empresa para 
-- contar la cantidad de gente que ingresa a tienda, uno para las tiendas de Latinoamerica y otro para Europa. 
-- Obtener en una unica tabla, las entradas a tienda de ambos sistemas.
-- 11 Cuales son los productos disponibles para la venta (activos) de la marca Phillips?
-- 12 Obtener el monto vendido por tienda y moneda y ordenarlo de mayor a menor por valor nominal.
-- 13 Cual es el precio promedio de venta de cada producto en las distintas monedas? Recorda que los valores de venta, impuesto, 
-- descuentos y creditos es por el total de la linea.
-- 14 Cual es la tasa de impuestos que se pago por cada orden de venta?


/*
Clase 3
Respuestas:
*/


/*
-- 1 Mostrar nombre y codigo de producto, categoria y color para todos los productos de la marca Philips y Samsung, 
-- mostrando la leyenda "Unknown" cuando no hay un color disponible
select codigo_producto, nombre, case when color is null then 'Unknown' else color end as color2 
from stg.product_master where nombre like ('%PHILIPS%') or nombre like ('%Samsung%')

CASE WHEN material IS NULL THEN 'Unknown' when material = 'PLASTICO' THEN 'Plastico' when material = 'plastico' THEN 'Plastico' 
ELSE material END as material_consolidado
-- 2 Calcular las ventas brutas y los impuestos pagados por pais y provincia en la moneda correspondiente.
-- 3 Calcular las ventas totales por subcategoria de producto para cada moneda ordenados por subcategoria y moneda.
-- 4 Calcular las unidades vendidas por subcategoria de producto y la concatenacion de pais, provincia; usar guion como separador y usarla para ordernar el resultado.
-- 5 Mostrar una vista donde sea vea el nombre de tienda y la cantidad de entradas de personas que hubo desde la fecha de apertura para el sistema "super_store".
-- 6 Cual es el nivel de inventario promedio en cada mes a nivel de codigo de producto y tienda; mostrar el resultado con el nombre de la tienda.
-- 7 Calcular la cantidad de unidades vendidas por material. Para los productos que no tengan material usar 'Unknown', homogeneizar los textos si es necesario.
-- 8 Mostrar la tabla order_line_sales agregando una columna que represente el valor de venta bruta en cada linea convertido a dolares usando la tabla de tipo de cambio.
-- 9 Calcular cantidad de ventas totales de la empresa en dolares.
-- 10 Mostrar en la tabla de ventas el margen de venta por cada linea. Siendo margen = (venta - promociones) - costo expresado en dolares.
-- 11 Calcular la cantidad de items distintos de cada subsubcategoria que se llevan por numero de orden.
*/

/*
Clase 4
Respuestas:
*/


/*
-- 1 Crear un backup de la tabla product_master. Utilizar un esquema llamada "bkp" y agregar un prefijo al nombre de la tabla con la fecha del backup en forma de numero entero.
-- 2 Hacer un update a la nueva tabla (creada en el punto anterior) de product_master agregando la leyendo "N/A" para los valores null de material y color. Pueden utilizarse dos sentencias.
-- 3 Hacer un update a la tabla del punto anterior, actualizando la columa "is_active", desactivando todos los productos en la subsubcategoria "Control Remoto".
-- 4 Agregar una nueva columna a la tabla anterior llamada "is_local" indicando los productos producidos en Argentina y fuera de Argentina.
-- 5 Agregar una nueva columna a la tabla de ventas llamada "line_key" que resulte ser la concatenacion de el numero de orden y el codigo de producto.
-- 6 Eliminar todos los valores de la tabla "order_line_sale" para el POS 1.
-- 7 Crear una tabla llamada "employees" (por el momento vacia) que tenga un id (creado de forma incremental), nombre, apellido, fecha de entrada, fecha salida, telefono, pais, provincia, codigo_tienda, posicion. Decidir cual es el tipo de dato mas acorde.
-- 8 Insertar nuevos valores a la tabla "employees" para los siguientes 4 empleados:
-- 9 Juan Perez, 2022-01-01, telefono +541113869867, Argentina, Santa Fe, tienda 2, Vendedor.
-- 10 Catalina Garcia, 2022-03-01, Argentina, Buenos Aires, tienda 2, Representante Comercial
-- 11 Ana Valdez, desde 2020-02-21 hasta 2022-03-01, España, Madrid, tienda 8, Jefe Logistica
-- 12 Fernando Moralez, 2022-04-04, España, Valencia, tienda 9, Vendedor.
-- 13 Crear un backup de la tabla "cost" agregandole una columna que se llame "last_updated_ts" que sea el momento exacto en el cual estemos realizando el backup en formato datetime.
-- 14 El cambio en la tabla "order_line_sale" en el punto 6 fue un error y debemos volver la tabla a su estado original, como lo harias?
*/
