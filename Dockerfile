FROM maven:3.9-eclipse-temurin-21-alpine AS builder

ARG ENVIRONMENT=production
ENV ENVIRONMENT $ENVIRONMENT

WORKDIR /app
COPY . .
RUN mvn clean package -P$ENVIRONMENT
RUN mv ./target/*.jar ./target/run-app.jar


FROM eclipse-temurin:21-jre-jammy AS runner

RUN groupadd -g 501 java-app && useradd -u 500 -g java-app java
USER 500:501

COPY --from=builder /app/target/run-app.jar .
EXPOSE 8080


ENTRYPOINT ["java", "-jar","run-app.jar"]
