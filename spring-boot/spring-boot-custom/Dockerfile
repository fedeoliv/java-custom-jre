FROM maven:3.6-jdk-12-alpine as build
WORKDIR /app
COPY pom.xml .
COPY src src
COPY create-jre.sh .
RUN mvn clean package
RUN ./create-jre.sh

FROM alpine:3.8
EXPOSE 8080
WORKDIR /app
COPY --from=build /app/target/spring-boot-app-*.jar app.jar
COPY --from=build /app/myjre ./myjre
CMD ["./myjre/bin/java", "-jar", "app.jar"]
