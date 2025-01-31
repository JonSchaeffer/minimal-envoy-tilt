# Load Kubernetes manifest
k8s_yaml("k8s/envoy.yaml")

# Expose Envoy admin interface & service ports
k8s_resource("envoy", port_forwards=['0.0.0.0:9901:9901', '0.0.0.0:10000:10000'], auto_init=True)

# Load the configmap tilt extension
load('ext://configmap', 'configmap_create')

# Create a config map named 'envoy-config' from the 'minimal-envoy-config.yaml' file.
configmap_create('envoy-config', from_file=['minimal-envoy-config.yaml=./minimal-envoy-config.yaml'], watch=True)

# Add Reloader Helm Repo
load('ext://helm_resource', 'helm_resource', 'helm_repo')
helm_repo('stakater', 'https://stakater.github.io/stakater-charts')
helm_resource('reloader', 'stakater/reloader', )

# Define dependencies to ensure resources come up in the right order.
k8s_resource('reloader', resource_deps=['stakater'])
