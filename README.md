# Tomcat
This is for Tomcat Server Docker container

### Versions

* Ubuntu 14.04
* Java(TM) SE Runtime Environment (build 1.7.0_71-b14)
* apache-tomcat-7.0.64 

Installation Steps for Tomcat Server.

Start the Docker container as follows,

1. docker run -p 80:80 -p 8080:8080 -t -i --privileged=true brandixi3/tomcat /bin/bash

Now you can access Tomcat using ,

http://server_ip:8080

