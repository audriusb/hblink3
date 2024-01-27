FROM python:alpine

RUN apk update
RUN apk add git python3-dev supervisor envsubst
RUN pip install twisted bitarray
RUN git clone https://github.com/lz5pn/HBlink3 /tmp/hblink
RUN mv /tmp/hblink/HBlink3/ /opt/
RUN mv /tmp/hblink/HBmonitor/ /opt/
RUN mv /tmp/hblink/dmr_utils3/ /opt/
RUN rm -rf /tmp/hblink

RUN pip install --upgrade /opt/dmr_utils3/
RUN pip install -r /opt/HBlink3/requirements.txt
RUN pip install -r /opt/HBmonitor/requirements.txt

RUN mkdir -p /etc/supervisor.d/
COPY supervisord.ini /etc/supervisor.d/hblink.ini

RUN mkdir -p /opt/templates
COPY templates/* /opt/templates/

RUN mkdir -p /var/log/hblink/
RUN mkdir -p /log/

ENV MASTER_PORT=62030
ENV MASTER_PASSPHRASE=s3cr37w0rd

ENV PARROT_PORT=54100
ENV PARROT_PASSWORD=echopassword

ENV HBMON_PORT=8081
ENV HBMON_AUTH=False
ENV HBMON_USER=hblink
ENV HBMON_PASSWORD=hblink

COPY entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT [ "sh", "-c", "/opt/entrypoint.sh"]