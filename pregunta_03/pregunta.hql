/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
de la tercera columna.

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/


DROP TABLE IF EXISTS data;
DROP TABLE IF EXISTS pregunta;
CREATE TABLE data 
        (letter STRING,
        dates DATE,
        number INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
TBLPROPERTIES ("skip.header.line.count"="0");
LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE data;
CREATE TABLE pregunta 
AS 
        SELECT DISTINCT number
        FROM data 
        ORDER BY number
        LIMIT 5;
INSERT OVERWRITE LOCAL DIRECTORY './output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT 
        *
FROM 
        pregunta;