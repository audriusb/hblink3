#!/bin/sh
envsubst < /opt/templates/hblink.cfg > /opt/HBlink3/hblink.cfg
envsubst < /opt/templates/parrot.cfg > /opt/HBlink3/playback.cfg
envsubst < /opt/templates/hbmonitor.py > /opt/HBmonitor/config.py
envsubst < /opt/templates/rules.py > /opt/HBlink3/rules.py

touch /var/log/hblink/parrot.log
touch /log/hbmon.log

/usr/bin/supervisord