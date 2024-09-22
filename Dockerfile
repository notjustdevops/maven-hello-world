# path: Dockerfile

# Use OpenJDK image
FROM openjdk:11-jre-slim

# Set working directory
WORKDIR /app

# Copy the built JAR file into the container
COPY Dvorkin-Guy-From-Kepler-186f-App/target/dvorkin-guy-from-kepler-186f-app-*.jar app.jar

# Ensure the container runs as a non-root user
USER nobody

# Run the JAR
ENTRYPOINT ["java", "-jar", "app.jar"]
