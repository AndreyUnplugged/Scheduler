FROM mongo:5.0.2

RUN apt-get update -y
RUN apt-get install -y python3 \
     && apt-get install -y pip  && apt-get install -y nano  \
    supervisor default-jre
RUN pip install awscli

COPY dump-creating.sh dump-creating.sh
COPY aws/config   /root/.aws/config
COPY aws/credentials   /root/.aws/credentials
COPY supervisor.conf /etc/supervisor/conf.d/supervisor.conf
COPY Scheduler.jar Scheduler.jar
RUN  chmod +x dump-creating.sh
ENV EXECUTE-COMMAND=dump-creating.sh
ENV CRON-EXPRESSION="*/20 * * * *"
CMD /usr/bin/supervisord