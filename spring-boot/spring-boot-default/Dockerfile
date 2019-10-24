FROM maven:3.6-jdk-12-alpine as build       

WORKDIR /app

COPY pom.xml .
COPY src src

RUN mvn clean package

FROM openjdk:12-alpine

COPY --from=build \
    /app/target/spring-boot-app-1.0.0.jar \
    /app/target/app.jar

CMD ["java", "-jar", "/app/target/app.jar"]
