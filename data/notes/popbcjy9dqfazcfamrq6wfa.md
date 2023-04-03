
## For all machines

Create a folder for the config file.

```bash
mkdir -p /etc/rancher/rke2
cd /etc/rancher/rke2
```

Create a file `registries.yaml`,

```yaml
mirrors:
  docker.io:
    endpoint:
      - "http://192.168.1.11:8880"
```

## Create Masters

Create a file `config.yaml`,

```yaml
token: your_secret_token
# Commented for the first master, but uncomment this for extra masters
# server: https://kubernetes.local:9345
tls-san:
  - kubernetes.local
  - 127.0.0.1
cluster-cidr: "10.42.0.0/16"
service-cidr: "10.43.0.0/16"
node-taint:
  - "CriticalAddonsOnly=true:NoExecute"
disable-cloud-controller: true
# debug: true
cni:
  - calico
```

Install the bins for master,

    curl -sfL https://get.rke2.io | INSTALL_RKE2_CHANNEL=v1.24 sh -
    systemctl enable rke2-server.service

Start the service,
    systemctl start rke2-server.service


## Workers

Create config.yaml files,

```yaml
token: your_secret_token
server: https://kubernetes.local:9345
# debug: true
```

Install the bins for workers,

    curl -sfL https://get.rke2.io | INSTALL_RKE2_TYPE="agent" INSTALL_RKE2_CHANNEL=v1.24 sh -
    systemctl enable rke2-agent.service

Start the service,
    systemctl start rke2-agent.service
    
## Airgap note

I airgap install quite a bit since bandwitdh can be precious and docker hub's ultimately not free.

To cache the images copy the files from the release, e.g., https://github.com/rancher/rke2/releases/download/v1.24.3%2Brke2r1/rke2-images-all.linux-amd64.txt.


Create a script to pre-pull each of the images. The following assumes the downloaded images file above is called `rancher_images_file.txt`. It also assumes your docker deamon has been configured to use [[Mirrors|tools.nexus.mirrors]].

```bash
#!/usr/bin/env bash

while read p; do
  docker pull "$p" 
done <rancher_images_file.txt
```