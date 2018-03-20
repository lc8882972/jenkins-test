FROM openjdk:8-jdk-alpine

COPY build/libs/springboot-0.0.1-SNAPSHOT.jar /var/www/web/app.jar

VOLUME /tmp

EXPOSE 8060

USER root

WORKDIR /var/www/web/

ENTRYPOINT ["java" ,"-jar", "app.jar"]
