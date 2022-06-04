FROM openjdk:17
COPY dbManager /usr/src/app
WORKDIR /usr/src/app
RUN java -jar dbManager
