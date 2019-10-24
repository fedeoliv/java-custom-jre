FROM maven:3.6-jdk-12-alpine as build       

WORKDIR /app

COPY pom.xml .
COPY src src

RUN mvn clean compile assembly:single

FROM openjdk:12-alpine

COPY --from=build \
    /app/target/maven-app-1.0-SNAPSHOT-jar-with-dependencies.jar \
    /app/target/maven-app.jar

ENTRYPOINT ["java", "-jar"]
CMD ["/app/target/maven-app.jar"]
