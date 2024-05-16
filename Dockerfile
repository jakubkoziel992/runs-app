FROM maven:3.9-eclipse-temurin-21-alpine AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -Pproduction
RUN mv ./target/*.jar ./target/run-app.jar


FROM eclipse-temurin:21-jre-jammy AS runner

COPY --from=builder /app/target/run-app.jar .
ENTRYPOINT ["java", "-jar","run-app.jar"]