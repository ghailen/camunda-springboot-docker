# camunda-springboot-docker

Today we gonna learn how to dockerize a camunda spring boot application.

First thing is to create a camunda spring boot project using this tutoriel:
https://medium.com/@ghailenemark/camunda-with-spring-boot-example-e8277f17d7bf
![image](https://github.com/user-attachments/assets/f8fabca2-f357-4b3f-85ab-3e0b7a52a857)

The project structure:
![image](https://github.com/user-attachments/assets/d2716fc6-8010-48d1-9b5c-22c6f6ce3a06)

let s modify the bpmn file process.bpmn exist in resource, i put the task to user task in order to do a test after.

![image](https://github.com/user-attachments/assets/1efefc95-68b0-4913-b4e5-eeec7dcbbef9)

let's build the project and generate the jar:

![image](https://github.com/user-attachments/assets/62070c51-a350-4ed3-97c4-62c2633f489e)

Now let s add a DockerFile in the project:


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
![image](https://github.com/user-attachments/assets/348cdb0b-eb39-4434-b947-1f7b117af2fd)



