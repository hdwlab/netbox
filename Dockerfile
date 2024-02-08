FROM quay.io/netboxcommunity/netbox:v3.7.1

RUN /opt/netbox/venv/bin/pip install --no-warn-script-location \
     netbox-topology-views==3.9.0