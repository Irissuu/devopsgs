FROM gradle:8.5-jdk17 AS builder
WORKDIR /app
COPY . .

RUN chmod +x ./gradlew
RUN ./gradlew bootJar

FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app

RUN useradd -m ykx
USER ykx

COPY --from=builder /app/build/libs/*.jar app.jar

ENV DB_HOST=db \
    DB_PORT=3306 \
    DB_NAME=flowguard \
    DB_USER=user \ 
    DB_PASS=a0b4vk3

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
