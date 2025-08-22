# Stage 1: Build the Spring Boot app
FROM maven:3.9.6-eclipse-temurin-21 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the app
FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app

# Copy the JAR from the builder stage
COPY --from=builder /app/target/learn-docker-mysql.jar app.jar

# Copy wait-for-it.sh script
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

# Use wait-for-it to wait for MySQL before starting Spring Boot
ENTRYPOINT ["/wait-for-it.sh", "db:3306", "--timeout=60", "--strict", "--", "java", "-jar", "app.jar"]