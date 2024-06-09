# Build Stage
FROM gradle:7.6.0-jdk17 AS build

COPY . /home/gradle/project
WORKDIR /home/gradle/project

RUN echo "org.gradle.java.home=/opt/java/openjdk" >> /home/gradle/project/gradle.properties
RUN gradle clean build -x test

# Package Stage
FROM eclipse-temurin:17-alpine

COPY --from=build /home/gradle/project/build/libs/*.jar /usr/app/sample1app.jar

ENTRYPOINT ["java", "-jar", "/usr/app/sample1app.jar"]
