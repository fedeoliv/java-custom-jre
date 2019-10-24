FROM maven:3.6-jdk-12-alpine as build

WORKDIR /app
COPY pom.xml .
COPY src src
RUN mvn clean package

RUN jlink --output myjre --add-modules $(jdeps --ignore-missing-deps --print-module-deps target/spring-boot-app-1.0.0.jar),java.xml,jdk.unsupported,java.sql,java.naming,java.desktop,java.management,java.security.jgss,java.instrument

FROM alpine:3.8
WORKDIR /app
COPY --from=build /app/target/spring-boot-app-1.0.0.jar .
COPY --from=build /app/myjre ./myjre

CMD ["./myjre/bin/java", "-jar", "spring-boot-app-1.0.0.jar"]
