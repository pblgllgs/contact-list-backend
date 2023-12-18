FROM maven:3.9.6-eclipse-temurin-21-alpine@sha256:0d5d7b952ecb945b52318e22526b91f52b9b9f979b8c83d6718ed3e1bbfde037 AS build
RUN mkdir /project
COPY . /project
WORKDIR /project
RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-alpine@sha256:7e1c2f37fffae18238a4bb018080a0a46d23bfe646d0e1eaacb35a4fdf383a2d
RUN apk add dumb-init
RUN mkdir /app
RUN addgroup --system javauser && adduser -S -s /bin/false -G javauser javauser
COPY --from=build /project/target/*.jar /app/application.jar
WORKDIR /app
RUN chown -R javauser:javauser /app
USER javauser
CMD "dumb-init" "java" "-jar" "application.jar"