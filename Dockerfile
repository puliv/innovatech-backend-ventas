# ── STAGE 1: Build ────────────────────────────
FROM maven:3.9-eclipse-temurin-17-alpine AS builder

WORKDIR /app

COPY Springboot-API-REST/pom.xml .
RUN mvn dependency:go-offline -B

COPY Springboot-API-REST/src ./src
RUN mvn clean package -DskipTests -B

# ── STAGE 2: Production ───────────────────────
FROM eclipse-temurin:17-jre-alpine AS production

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar

RUN chown appuser:appgroup app.jar

USER appuser

EXPOSE 8080

ENTRYPOINT ["java", "-XX:+UseContainerSupport", "-XX:MaxRAMPercentage=75.0", "-jar", "app.jar"]