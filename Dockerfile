FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
    cron \
    rsyslog && \
    rm -rf /var/lib/apt/lists/*

COPY cron /etc/cron.d/sample

RUN mkdir /data

CMD service rsyslog start && service cron start && tail -f /var/log/syslog