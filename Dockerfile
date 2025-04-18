FROM quay.io/netboxcommunity/netbox:v4.2.7

RUN curl https://bootstrap.pypa.io/get-pip.py | python \
  && pip install --no-warn-script-location \
     netbox-topology-views==4.2.1

COPY <<EOF /etc/netbox/config/plugins.py
PLUGINS = ["netbox_topology_views"]
PLUGINS_CONFIG = {
    'netbox_topology_views': {
        'static_image_directory': 'netbox_topology_views/img',
        'allow_coordinates_saving': True,
        'always_save_coordinates': True
    }
}
EOF

# Collect static files \
RUN SECRET_KEY="dummydummydummydummydummydummydummydummydummydummy" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input
