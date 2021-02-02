FROM maven:3.6.0-jdk-11
WORKDIR /project
EXPOSE 8080
USER root
RUN apt-get update
COPY . /project
RUN mvn package

FROM java:jre-alpine
WORKDIR /project
COPY --from=0 /project/target/*.jar .
ENTRYPOINT java -jar *.jar --spring.profiles.active=mysql
