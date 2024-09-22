# Use OpenJDK image
FROM openjdk:11-jre-slim

# Set working directory
WORKDIR /app

# Copy the built JAR file into the container
COPY target/Dvorkin-Guy-From-Kepler-186f-App-*.jar app.jar

# Ensure the container runs as a non-root user
USER nobody

# Run the JAR
ENTRYPOINT ["java", "-jar", "app.jar"]
