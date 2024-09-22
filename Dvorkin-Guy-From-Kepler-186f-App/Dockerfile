# path: /home/notjust/Documents/devops/Projects/Rafael/maven-hello-world/Dvorkin-Guy-From-Kepler-186f-App/Dockerfile

# Use OpenJDK image
FROM openjdk:11-jre-slim

# Set working directory
WORKDIR /app

# Copy the built JAR file into the container
# Update the file name to match the actual JAR file generated
COPY target/dvorkin-guy-from-kepler-186f-app.jar app.jar

# Ensure the container runs as a non-root user
USER nobody

# Run the JAR
ENTRYPOINT ["sh", "-c", "java -jar app.jar && sleep 600"]

