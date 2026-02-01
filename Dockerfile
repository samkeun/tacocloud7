# Build stage
FROM maven:3.9.9-eclipse-temurin-23 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM eclipse-temurin:23-jre-alpine
COPY --from=build /lec25.3-0.0.1-SNAPSHOT.jar taco.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "taco.jar"]


# Dockefile
#FROM maven:3.8.5-openjdk-17 AS build
#COPY . .
#RUN mvn clean package -DskipTests
#
#FROM openjdk:17-slim
#COPY --from=build /lec25.3-0.0.1-SNAPSHOT.jar taco.jar
#EXPOSE 8085
#ENTRYPOINT ["java", "-jar", "taco.jar"]
