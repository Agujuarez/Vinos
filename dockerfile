# Usa una imagen base con Ubuntu
FROM ubuntu:20.04

# Configura el entorno para no mostrar interacciones durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Instala dependencias necesarias, OpenJDK y Python 3.12
RUN apt-get update && \
    apt-get install -y software-properties-common wget gnupg && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y curl openjdk-8-jdk python3.12 && \
    apt-get clean

# Instala el cliente de MongoDB (mongo shell)
RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add - && \
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list && \
    apt-get update && \
    apt-get install -y mongodb-org-shell && \
    apt-get clean

# Descarga e instala Spark
RUN curl -O https://archive.apache.org/dist/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz && \
    tar -xvzf spark-2.4.4-bin-hadoop2.7.tgz && \
    mv spark-2.4.4-bin-hadoop2.7 /usr/local/spark && \
    rm spark-2.4.4-bin-hadoop2.7.tgz

# Configura las variables de entorno
ENV SPARK_HOME=/usr/local/spark
ENV PATH=$SPARK_HOME/bin:$PATH
ENV PYSPARK_PYTHON=python3.12
ENV PYSPARK_DRIVER_PYTHON=python3.12

# Expone los puertos necesarios para Spark
EXPOSE 8080 8081 7077

# Comando de inicio para el contenedor de Spark
CMD ["/usr/local/spark/bin/spark-class", "org.apache.spark.deploy.master.Master"]