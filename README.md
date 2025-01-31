# Playground

## Usage for Testing Envoy Things Locally

1. Make a change to `minimal-envoy-config.yaml`
2. Start Envoy in Docker via `just docker-envoy`


## Getting Started with Tilt

### Required Dependencies

- k3d
- helm
- tilt

To install for mac: `brew install k3d helm tilt`

### Optional Dependencies (But highly encouraged)

- k9s
- kubectx

To install for mac: `brew install k9s kubectx`

To install everything: `brew install k3d helm tilt k9s kubectx`

### Running Tilt

Provided you have the required dependencies installed and you are in the root of the repo, you can run the below commands to get started with Tilt

`k3d cluster create --config k3d-cluster.yaml`

Note: This command only needs to be run once. If you delete the k3d containers out of Docker, do a docker purge, or docker isn't showing any containers, you will need to run the above command again.

Once the k3d cluster has been created, then you can run from the mother repo's root dir:
`tilt up`

Note: `tilt up` can only be run from the repo's root dir.

### Accessing the application

Envoy is exposed on two ports: 9901 and 10000. You can access the Envoy admin page at `http://localhost:9901` and the application at `http://localhost:10000`

### Viewing pods in tilt

If you have installed k9s and kubectx, you can run these commands to view the local cluster.

`kubectx k3d-tilt`
`k9s`

This will drop you into k9s, a graphical tool for view Kubernetes clusters. You can read more about the tool [here](https://k9scli.io/).

To view pods, you can enter on your keyboard `:pods` + `enter`. You can navigate up and down using vim keystrokes. When highlighted on a pod, press `l` to view the logs. `Esc` will get you back. In that same vein, `s` when a pod is highlighted will pop you in a shell session for that pod.

### Pausing the k3d cluster

If you want to bring your cluster down for some reason, you can do that and resume it later. 

1. If `tilt` is running, stop it with `ctrl + c` (from the terminal its running) THEN
2. From the terminal run `k3d cluster stop tilt`

### Resuming the k3d cluster

1. From the terminal run `k3d cluster start tilt`
2. From the repo's root dir, run `tilt up`

This will bring tilt back up, and tilt will re-attach to the running resources.

### Deleting the k3d cluster

If you need to completely remove the k3d cluster, you can do the following

1. From the terminal, run `k3d cluster delete tilt`

If you need to bring the cluster back up, from the repo's root dir, run `k3d cluster create --config k3d-cluster.yaml`


