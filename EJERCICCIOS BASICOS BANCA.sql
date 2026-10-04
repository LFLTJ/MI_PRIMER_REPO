--USE BD_BANCO
/*
Listar todos los campos de la tabla cliente perfil.
Mostrar solo los campos código, sexo y fecha de nacimiento.
Mostrar solo los clientes del sexo masculino.
Cuántos clientes tienen teléfono.
Listar a los 10 clientes con mayores ingresos.
Listar al 20% de clientes con mayor rentabilidad.
*/
--Listar todos los campos de la tabla cliente perfil.
select *
from TB_CLIENTE_PERFIL;

--Mostrar solo los campos código, sexo y fecha de nacimiento.
SELECT CODIGO, SEXO, FH_NACIMIENTO
FROM TB_CLIENTE_PERFIL;

--Mostrar solo los clientes del sexo masculino.
SELECT *
FROM TB_CLIENTE_PERFIL
WHERE SEXO='M'
--Cuántos clientes tienen teléfono.

SELECT *--COUNT(*) 
FROM TB_CLIENTE_PERFIL 
WHERE TIENE_TELEFONO='S'; 

SELECT DISTINCT TIENE_TELEFONO
FROM TB_CLIENTE_PERFIL ;
--Listar a los 10 clientes con mayores ingresos.
SELECT TOP 10 *--COUNT(*) 
FROM TB_CLIENTE_PERFIL 
ORDER BY INGRESO DESC
--LIMIT 10 MYSQL ,BIGQUERY ,POSGRES SQL

--Listar al 20% de clientes con mayor rentabilidad.

SELECT TOP 20 PERCENT *
FROM TB_CLIENTE_RENTABILIDAD
ORDER BY RENTABILIDAD DESC

--LA OTRA
---
with calculo_percentil as (
	select * ,
		PERCENT_RANK() OVER (ORDER BY RENTABILIDAD DESC) as percentil
	from TB_CLIENTE_RENTABILIDAD
)
select *
from calculo_percentil
where percentil <=0.2



