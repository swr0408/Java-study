# Stage 1: Build stage
FROM gradle:7.6.0-jdk17 AS build

# Set working directory
WORKDIR /home/gradle/project

# Copy the application code
COPY . .

# Set Java home in gradle.properties
RUN echo "org.gradle.java.home=/opt/java/openjdk" >> gradle.properties

# Build the application, excluding tests
RUN gradle clean build -x test

# Stage 2: Run stage
FROM eclipse-temurin:17-alpine

# Set working directory
WORKDIR /usr/app

# Copy the built JAR file from the build stage
COPY --from=build /home/gradle/project/build/libs/*.jar /usr/app/sample1app.jar

# Set the entry point for the container
ENTRYPOINT ["java", "-jar", "/usr/app/sample1app.jar"]
