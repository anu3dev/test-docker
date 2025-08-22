FROM openjdk:22-slim-bullseye
ADD target/learn-docker-mysql.jar learn-docker-mysql.jar
ENTRYPOINT ["java", "-jar", "/learn-docker-mysql.jar"]
