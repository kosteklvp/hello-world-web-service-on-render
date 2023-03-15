FROM maven:3-openjdk-17-slim AS build
COPY . .
RUN mvn clean package

FROM openjdk:17-jdk-slim
COPY --from=build /target/hello-world-1.0.jar hello-world.jar
# ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["java","-jar","hello-world.jar"]