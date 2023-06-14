/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Construya una consulta que ordene la tabla por letra y valor (3ra columna).

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
        SELECT *
        FROM data 
        ORDER BY letter,number,dates;
INSERT OVERWRITE LOCAL DIRECTORY './output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT 
        *
FROM 
        pregunta;
