FROM maven:3.6-jdk-12-alpine as build       

WORKDIR /app

COPY pom.xml .
COPY src src

RUN mvn package

FROM openjdk:12-alpine

COPY --from=build \
    /app/target/default-maven-sample-1.0-SNAPSHOT.jar \
    /app/target/default-maven-sample.jar

# Java 12 already sets -XX:+UseContainerSupport by default
ENTRYPOINT ["java", "-jar"]
CMD ["/app/target/default-maven-sample.jar"]
