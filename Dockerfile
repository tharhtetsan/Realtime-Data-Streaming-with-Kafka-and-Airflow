FROM apache/airflow:2.10.2-python3.10

USER root


COPY requirements.txt requirements.txt

RUN apt-get update
RUN apt install software-properties-common -y
RUN apt-get update && sudo apt-get upgrade -y
RUN apt-get install -y gcc python3-dev openjdk-17-jdk && \
    apt-get clean

# Set JAVA_HOME environment variable
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-arm64

USER airflow
RUN pip install -r requirements.txt
