From camunda/camunda-bpm-platform:latest
COPY ./target/*.jar /usr/local/tomcat/webapps/camunda-springboot-docker.jar
ENTRYPOINT ["java","-jar","/usr/local/tomcat/webapps/camunda-springboot-docker.jar"]
