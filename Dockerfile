# Stage 1: Build stage
FROM gradle:7.6.0-jdk17 as build

# Set the working directory
WORKDIR /home/gradle/project

# Copy project files to the build context
COPY . .

# Set the Java home directory in gradle properties
RUN echo "org.gradle.java.home=/opt/java/openjdk" >> gradle.properties

# Build the application, excluding tests
RUN gradle clean build -x test

# Stage 2: Run stage
FROM eclipse-temurin:17-alpine

# Set the working directory
WORKDIR /usr/app

# Copy the built JAR file from the build stage
COPY --from=build /home/gradle/project/build/libs/*.jar /usr/app/sample1app.jar

# Expose port 8080
EXPOSE 8080

# Define the entry point for the container
ENTRYPOINT ["java", "-jar", "/usr/app/sample1app.jar"]
