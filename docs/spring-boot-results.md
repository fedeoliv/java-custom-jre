# Comparing results (Spring Boot)

The `spring-boot` folder contains two identical Spring Boot projects, where one uses the default JRE (`spring-boot-default`) while the other leverages a custom JRE (`spring-boot-custom`).

They have the same `Application.java` structure:

```java
@SpringBootApplication
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Bean
    public CommandLineRunner commandLineRunner(ApplicationContext ctx) {
        return args -> {
            System.out.println("Hello world!");
        };
    }
}
```

The structure of the `HelloController.java` in both project is also the same:

```java
@RestController
public class HelloController {

    @RequestMapping("/")
    public String index() {
        return "Greetings from Spring Boot!";
    }
}
```

Both projects provide:

- Unit tests and integration tests.
- Production-ready features - [Spring Boot Actuator](https://docs.spring.io/spring-boot/docs/2.1.6.RELEASE/reference/htmlsingle/#production-ready) - such as health (`/actuator/health`) and info (`/actuator/info`).

> **Note:** Both project structures are based on the official Spring tutorial that you can find [here](https://spring.io/guides/gs/spring-boot/).

The difference between the Docker images:

- The `spring-boot-default` is a **default** Spring Boot project tht uses the `openjdk:12-alpine` as the Docker base image.
- The `spring-boot-custom` is a **modularized** Spring Boot project that uses [jlink](https://docs.oracle.com/en/java/javase/11/tools/jlink.html) to create a custom JRE and uses `alpine:3.8` as the Docker base image.

## Getting Started

### **Building and running the default project**

On the `spring-boot-default` folder, build the image:

```sh
docker build -t spring-boot-app:1.0 .
```

Make sure it's running:

```sh
docker run -d -p 8080:8080 spring-boot-app:1.0
```

If you run `curl http://localhost:8080/`, is expected to see the following message: `Greetings from Spring Boot!`.

### **Building and running the project with custom JRE**

On the `spring-boot-custom` folder, build the image:

```sh
docker build -t spring-boot-app:2.0 .
```

Make sure it's running:

```sh
docker run -d -p 8081:8080 spring-boot-app:2.0
```

If you run `curl http://localhost:8081/`, is expected to see the following message: `Greetings from Spring Boot!`.

## Results

Now let's list and compare the image size for each application with the following command:

```sh
docker images
```

The result will be similar to this one:

![](./images/spring-boot-results.jpg)

The image size was reduced from **358MB** to **113MB**, representing **~68.4%** reduction in the image size.

> **Note:** The `spring-boot-custom` sample uses `alpine:3.8` as the base image, while the `spring-boot-default` uses the `openjdk:12-alpine`. This is because the `openjdk:12-alpine` image already comes with the default JRE, while the `alpine:3.8` doesn't, so we add the custom JRE in the alpine image. 
