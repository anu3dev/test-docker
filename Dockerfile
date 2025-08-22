FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app

# Install bash
RUN apk add --no-cache bash

COPY --from=builder /app/target/learn-docker-mysql.jar app.jar
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

ENTRYPOINT ["/wait-for-it.sh", "db:3306", "--timeout=60", "--strict", "--", "java", "-jar", "app.jar"]