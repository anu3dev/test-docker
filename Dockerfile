FROM openjdk:22-slim-bullseye
ADD target/learn-docker.jar learn-docker.jar
ENTRYPOINT ["java", "-jar", "/learn-docker.jar"]