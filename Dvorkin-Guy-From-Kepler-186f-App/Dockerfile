# path: /home/notjust/Documents/devops/Projects/Rafael/maven-hello-world/Dvorkin-Guy-From-Kepler-186f-App/Dockerfile

FROM openjdk:11-jre-slim

WORKDIR /app

COPY target/dvorkin-guy-from-kepler-186f-app.jar app.jar

USER nobody

ENTRYPOINT ["java", "-jar", "app.jar"]
CMD ["sleep", "600"]