FROM maven:3.5.4-jdk-8-alpine as maven
COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn dependency:go-offline -B
RUN mvn package
FROM openjdk:8u171-jre-alpine
WORKDIR /adevguide
COPY --from=maven target/java-opswerks-1.0-SNAPSHOT.jar ./java-opswerks-1.0-SNAPSHOT.jar
CMD ["java", "-jar", "./java-opswerks-1.0-SNAPSHOT.jar"]