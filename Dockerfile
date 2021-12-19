from ubuntu:20.04

# Install system tools

RUN apt-get update -y && \
    apt-get install net-tools iputils-ping tcpdump vim -y

# Install & configure suricata
RUN apt-get install software-properties-common -y && \
    add-apt-repository ppa:oisf/suricata-stable && \
    apt-get update -y && \ 
    apt-get install suricata suricata-dbg -y

COPY conf/suricata/suricata.yaml /etc/suricata/suricata.yaml
COPY conf/suricata/local.rules /var/lib/suricata/rules/local.rules
COPY conf/suricata/threshold.config /etc/suricata/threshold.config
COPY conf/suricata/disable.conf /etc/suricata/

RUN suricata-update

# Install & configure supervisor
RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

COPY conf/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
