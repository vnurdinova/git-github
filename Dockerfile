# FROM has to be FIRST statement.
FROM centos:centos7

# MAINTAINER is the user who manintains the images.
MAINTAINER veneratest@gmail.com

# RUN is to run the commands upon base image build. RUN command is used to execute at build time. And its result becomes part of the base image.
#THE ORDER OF EXECUTION ABSOLUTELY MATTERS!!! So RUN STATEMENT should always be before USER STATEMENT
RUN useradd -ms /bin/bash test
RUN echo "password" | passwd --stdin test
RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf
RUN echo "nameserver 8.8.4.4" >> /etc/resolv.conf

# IF YOU PUT  EXPOSE STATEMENT BEFORE RUN STATEMENT (in which you specify any command that needs network access) IT RESOLVES NETWORK CONNECTIVITY ISSUE.
EXPOSE 80

RUN yum update -y && yum clean all
RUN yum install -y net-tools wget

# Here we are installing Java version 8. We are accepting license in order to install it.
RUN cd ~ && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jre-8u162-linux-x64.rpm"

# Here we are installing locally the package that is installed on our local directory. It may have dependencies that we dont already on our system.
RUN yum localinstall -y ~/jre-8u162-linux-x64.rpm

# USER is the NON-PRIVILIGED user logged in when container is run/created based on this image.
USER test

RUN cd ~ && echo "export JAVA_HOME=/usr/java/jdk1.8.0/jre" >> /home/venera/.bashrc

ENV JAVA_BIN /usr/java/jdk1.8.0/jre/bin
# CMD is the command to run but its result DOES NOT become the part of base image.
#EXPOSE

