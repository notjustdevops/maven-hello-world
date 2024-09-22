FROM openjdk:11-jre-slim

WORKDIR /app

COPY target/dvorkin-guy-from-kepler-186f-app-*.jar app.jar

USER nobody

ENTRYPOINT ["java", "-jar", "app.jar"]
