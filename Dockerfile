FROM centos:7

LABEL  maintainer "shinyay <syanagihara@pivotal.io>"

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.45/bin/apache-tomcat-8.5.45.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.45/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://tomcat.apache.org/tomcat-8.5-doc/appdev/sample/sample.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
