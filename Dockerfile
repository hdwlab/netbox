FROM quay.io/netboxcommunity/netbox:v3.7.8

RUN /opt/netbox/venv/bin/pip install --no-warn-script-location \
     netbox-topology-views==3.9.1

COPY <<EOF /etc/netbox/config/plugins.py
PLUGINS = ["netbox_topology_views"]
EOF

# Collect static files \
RUN SECRET_KEY="dummydummydummydummydummydummydummydummydummydummy" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input
