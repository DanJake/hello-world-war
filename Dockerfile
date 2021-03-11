FROM tomcat:8.0-alpine


ADD ./target/hello-world-war-1.0.0.war /usr/local/tomcat/webapps/thewebsiteisdown.war
EXPOSE 8080


CMD ["catalina.sh", "run"]
