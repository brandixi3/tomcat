##########################################################
# Dockerfile to build container image of Tomcat with MySQL
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER RajithaK (rajithak@brandix.com)

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /tmp

# Install Java & Other essential tools
RUN apt-get update &&\
    apt-get install -y wget &&\
    wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.tar.gz &&\
    mkdir -p /opt/java/ &&\
    tar -zxvf jdk-7u71-linux-x64.tar.gz -C /opt/java/ &&\
    update-alternatives --install /usr/bin/java java /opt/java/jdk1.7.0_71/bin/java 100 &&\
    update-alternatives --install /usr/bin/javac javac /opt/java/jdk1.7.0_71/bin/javac 100 &&\
    apt-get install -y elinks &&\
    apt-get install -y nano

# Install Tomcat

ADD apache-tomcat-7.0.64.zip /tmp/

RUN apt-get install -y unzip &&\
    unzip ./apache-tomcat-7.0.*.zip &&\
    mv ./apache-tomcat-7.0.*/ ./tomcat/ &&\
    cp -r ./tomcat/ /opt/ &&\
    chmod 775 /opt/tomcat/bin/* &&\
    groupadd tomcat &&\
    useradd -s /sbin/nologin/ -g tomcat -d /opt/tomcat/ tomcat &&\
    chown -R tomcat:tomcat /opt/tomcat/ &&\
    chmod 775 /opt/tomcat/webapps/ 
    
ADD tomcat /etc/init.d/  
RUN mv /etc/bash.bashrc /etc/bash.bashrc.backup
ADD bash.bashrc /etc/

RUN chmod 755 /etc/init.d/tomcat

EXPOSE 8080 80


    
