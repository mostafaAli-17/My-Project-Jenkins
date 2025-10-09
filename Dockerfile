FROM maven:3.6.3-jdk-11-slim
COPY pom.xml /app/
COPY . /app/
RUN mvn -f /app/pom.xml clean package
RUN mv /app/target/*.jar /app/app.jar
ENTRYPOINT ["java","-jar","/app/app.jar"]