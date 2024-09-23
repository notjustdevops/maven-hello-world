# First stage: Build the application
FROM maven:3.8.5-openjdk-11 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and the source code
COPY pom.xml .
COPY src ./src

# Build the application, creating a JAR file
RUN mvn clean package -DskipTests

# Second stage: Create a lightweight runtime container
FROM openjdk:11-jre-slim

# Set the working directory for the runtime
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/target/dvorkin-guy-from-kepler-186f-app.jar app.jar

# Switch to a non-root user
USER nobody

EXPOSE 8080

# Run the application and add sleep for testing
ENTRYPOINT ["sh", "-c", "java -jar app.jar && sleep 600"]
