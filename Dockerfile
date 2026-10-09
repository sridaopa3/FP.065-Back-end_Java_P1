FROM maven:3.9.6-eclipse-temurin-21-alpine AS builder

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src
RUN mvn package -DskipTests

FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar

#Puerto de Spring Boot
EXPOSE 8080

#Ejecutamos la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]