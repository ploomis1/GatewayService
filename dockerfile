FROM openjdk:8-jdk-alpine

WORKDIR /app

COPY target/gateway-service.jar .

EXPOSE 8080

CMD ["java", "-jar", "gateway-service.jar"]