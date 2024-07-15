FROM harbor.galaksiodatanubo.work/base/jdk:1.8.u291
WORKDIR /
RUN useradd app
USER root
COPY target/spring-demo.jar app.jar
COPY entrypoint.sh /entrypoint.sh
RUN mkdir /log && chmod 777 /log && chmod +x /entrypoint.sh
USER app
EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
#used for auto-ci trigger
