# camunda-springboot-docker

Today we gonna learn how to dockerize a camunda spring boot application.

First thing is to create a camunda spring boot project using this tutoriel:

https://medium.com/@ghailenemark/camunda-with-spring-boot-example-e8277f17d7bf
![image](https://github.com/user-attachments/assets/f8fabca2-f357-4b3f-85ab-3e0b7a52a857)

The project structure: (use jdk 8)
![image](https://github.com/user-attachments/assets/d2716fc6-8010-48d1-9b5c-22c6f6ce3a06)

let s modify the bpmn file process.bpmn exist in resource, i put the task to user task in order to do a test after.

![image](https://github.com/user-attachments/assets/1efefc95-68b0-4913-b4e5-eeec7dcbbef9)

let's build the project and generate the jar:

![image](https://github.com/user-attachments/assets/62070c51-a350-4ed3-97c4-62c2633f489e)
if you are using java 17 be sure to add this vm options to make the application work otherwise it will fail:
![image](https://github.com/user-attachments/assets/f766774d-1f52-492e-a3f3-7181011fa1e9)

Now let s add a "Dockerfile" in the project:
![image](https://github.com/user-attachments/assets/5bb79c9f-5524-4a5f-9a1c-0250a1da33b9)

content:
From camunda/camunda-bpm-platform:latest
COPY ./target/*.jar /usr/local/tomcat/webapps/camunda-springboot-docker.jar
ENTRYPOINT ["java","-jar","/usr/local/tomcat/webapps/camunda-springboot-docker.jar"]

* From camunda/camunda-bpm-platform:latest -> it will pull the camunda image
* COPY ./target/*.jar /usr/local/tomcat/webapps/camunda-springboot-docker.jar  ->  COPY source destination (the source is our generated jar in target , and the destination is the path in docker)
* ENTRYPOINT ["java","-jar","/usr/local/tomcat/webapps/camunda-springboot-docker.jar"]  -> the entrypoint to the jar

  
accually i have only those image, no camunda image exists:
![image](https://github.com/user-attachments/assets/307b5c81-93bd-4418-91c2-bded08c70ae3)
and no instance running:
![image](https://github.com/user-attachments/assets/4564202c-c75a-499b-b1c8-61f8f53e97be)

let's run the dockerfile using this command: (be sure you are in the right path where the dockerfile exist)
docker build --tag=camunda-springboot-docker-image .
![image](https://github.com/user-attachments/assets/8522ed66-5503-467e-9cf7-50c7fac0d4e5)

now we will check if the image is created:
![image](https://github.com/user-attachments/assets/1ac5d3c4-7fc3-4612-91f3-88e05502bb86)

let's run this image using this command:
docker run -d --name camunda-springboot-docker-container1 -p8080:8080 camunda-springboot-docker-image
![image](https://github.com/user-attachments/assets/25c631b4-cd65-4bb8-bf0b-1d2c5ec31e50)


let s check if the container is running using :
docker ps -a  or docker container ls or docker ps
![image](https://github.com/user-attachments/assets/71605fcd-ab9c-47fa-8223-b4ec6337dd67)

let's check the camunda container application log :
![image](https://github.com/user-attachments/assets/b02579cf-3b9d-4917-90a8-4190f9547440)

let's access to the link : 
http://localhost:8080/camunda/app/welcome/default/#!/welcome
username and password => demo:demo

let's start our process:
![image](https://github.com/user-attachments/assets/8813e89a-19b1-4326-a8c7-eae2333d4808)

and as we can see here in the interface of tasklist we can see the process instance working and waiting of the user action:
![image](https://github.com/user-attachments/assets/15d6ca30-cd92-419d-b5a2-c51528acaa63)





