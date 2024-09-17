# Vinos

## Correr [Docker Compose](docker-compose.yml) utilizando: 
```sh
docker compose up
```
## Ver los procesos de Docker corriendo utilizando:
```sh
docker ps
```
## Probar que Redis esta funcionando:
```sh
docker exec -it redis_container redis-cli
```
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
## Probar que MongoDb esté corriendo:
conectarte a MongoDB desde la terminal de Docker con el siguiente comando:
```sh
docker exec -it mongodb_container mongo -u usuario -p contraseña
```
Esto te conectará a la consola de MongoDB, donde puedes ejecutar comandos de base de datos como:
```sh
show dbs
```
## Verificar que HDFS esté corriendo
Interactuar directamente con HDFS desde la consola
```sh
docker exec -it hdfs_namenode /bin/bash
```
Una vez dentro del contenedor, puedes ejecutar comandos HDFS, como:
```sh
hdfs dfs -ls /
```
## Verificar que Spark esté corriendo
Acceder a la interfaz web del nodo master en http://localhost:8080, donde podrás ver el estado del clúster y los jobs que se están ejecutando.
Para ver el estado del worker de Spark, ve a http://localhost:8081.

Ejecutar un trabajo básico desde dentro del contenedor de Spark:
```sh
docker exec -it spark_master /bin/bash
spark-submit --class org.apache.spark.examples.SparkPi --master spark://spark_master:7077 /path/to/examples.jar
```
