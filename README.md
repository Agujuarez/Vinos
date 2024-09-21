# Vinos

## Correr [Docker Compose](docker-compose.yml) utilizando: 
```sh
docker compose up
```
## Ver los procesos de Docker corriendo utilizando:
```sh
docker ps
```
### Docker Compose: Se utiliza para orquestar múltiples contenedores Docker. Docker Compose permite definir y gestionar la configuración de todos los servicios de tu aplicación en un solo archivo [Docker Compose](docker-compose.yml), lo que facilita el despliegue y la escalabilidad. Se usa en vez de manejar contenedores individualmente para simplificar la administración del entorno.

## Probar que Redis esta funcionando:
```sh
docker exec -it redis_container redis-cli
```
Dentro del CLI de Redis, puedes ejecutar
```sh
ping
```
Deberías obtener una respuesta PONG, lo que indica que Redis está funcionando.

### Redis: Redis es una base de datos en memoria utilizada principalmente como cache para mejorar el rendimiento de las aplicaciones al almacenar temporalmente los datos. Redis se utiliza en lugar de bases de datos tradicionales para operaciones de almacenamiento rápido en memoria, lo que reduce la latencia en tareas como la autenticación, la administración de sesiones, o el almacenamiento de datos temporales.

## Verificar que Elasticsearch esté corriendo:
Ejecutar en la terminal el siguiente comando
```sh
curl http://localhost:9200
```
Deberías obtener una respuesta JSON similar a esta:
```js
{
  "name" : "elasticsearch_container",
  "cluster_name" : "docker-cluster",
  "cluster_uuid" : "abc123...",
  "version" : {
    "number" : "8.10.2",
    ...
  },
  "tagline" : "You Know, for Search"
}
```
### Elasticsearch: Se utiliza para realizar búsquedas y análisis sobre grandes volúmenes de datos en tiempo real. Elasticsearch es muy eficiente para búsquedas de texto completo y proporciona capacidades avanzadas de indexación y consulta. Se usa en lugar de otras bases de datos porque está optimizado para búsquedas rápidas y análisis de datos no estructurados.

## Probar que MongoDb esté corriendo:
conectarte a MongoDB desde la terminal de Docker con el siguiente comando:
```sh
docker exec -it mongodb_container mongo -u usuario -p contraseña
```
Esto te conectará a la consola de MongoDB, donde puedes ejecutar comandos de base de datos como:
```sh
show dbs
```
### MongoDB: MongoDB es una base de datos NoSQL orientada a documentos, lo que facilita el manejo de datos no estructurados y esquemas flexibles. Se utiliza en lugar de bases de datos SQL tradicionales cuando los datos requieren alta flexibilidad o cambian con frecuencia, ya que permite una mayor agilidad en el manejo de información sin esquemas rígidos.

## Verificar que HDFS esté corriendo
Interactuar directamente con HDFS desde la consola
```sh
docker exec -it hdfs_namenode /bin/bash
```
Una vez dentro del contenedor, puedes ejecutar comandos HDFS, como:
```sh
hdfs dfs -ls /
```
### Hadoop HDFS: HDFS (Hadoop Distributed File System) es un sistema de archivos distribuido que permite almacenar grandes volúmenes de datos a través de múltiples nodos en un clúster. Se usa en lugar de otros sistemas de archivos distribuidos porque está diseñado para soportar almacenamiento masivo y procesamiento distribuido a gran escala. Es ideal para aplicaciones de big data.

## Verificar que Spark esté corriendo
Acceder a la interfaz web del nodo master en http://localhost:8080, donde podrás ver el estado del clúster y los jobs que se están ejecutando.
Para ver el estado del worker de Spark, ve a http://localhost:8081.

Ejecutar un trabajo básico desde dentro del contenedor de Spark:
```sh
docker exec -it spark_master /bin/bash
spark-submit --class org.apache.spark.examples.SparkPi --master spark://spark_master:7077 /path/to/examples.jar
```
### Apache Spark: Spark es un motor de procesamiento de datos en memoria que permite realizar cálculos rápidos y distribuidos en grandes conjuntos de datos. Se usa en lugar de MapReduce (de Hadoop) porque ofrece un rendimiento mucho mayor al procesar los datos en memoria en lugar de escribir y leer desde el disco en cada operación, lo que lo hace más eficiente para análisis en tiempo real y procesamiento de datos a gran escala.

