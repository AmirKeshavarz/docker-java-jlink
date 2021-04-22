# Step : build and package
FROM maven:3.8.1-openjdk-11-slim as BUILD
WORKDIR /build
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src/ /build/src/
RUN mvn package
RUN jlink --output myjre --add-modules $(jdeps --print-module-deps target/hellojavadocker.jar),jdk.unsupported,java.xml,java.sql,java.naming,java.desktop,java.management,java.security.jgss,java.instrument

# Step : final docker image
FROM debian:10-slim
EXPOSE 8080
COPY --from=BUILD /build/target /opt/target
COPY --from=BUILD /build/myjre /opt/myjre
WORKDIR /opt/target
CMD ["/opt/myjre/bin/java", "-jar", "hellojavadocker.jar"]