FROM centos:7

MAINTAINER aksarav@middlewareinventory.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN yum install wget -y
RUN curl -O -L https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.82/bin/apache-tomcat-8.5.82.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.82/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
