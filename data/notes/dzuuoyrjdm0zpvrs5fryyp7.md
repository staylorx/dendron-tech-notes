
## Normal Use

The admin console is found here: http://192.168.1.11:8088/

## Install

Using the Docker on a Synology NAS is easy. I'm sure this can be done via the Docker package in the front-end, but I find it easiest to SSH into the NAS itself, then run the following bits from the command prompt.

We only need to create the volume once:

    sudo docker volume create --name nexus-data

## Update
I do the pull from time to time to ensure I always have the latest, and if something new pulls in then I recreate a container:

    sudo docker pull sonatype/nexus3

Once a latest image is pulled, I forcibly remove the container, then recreate it. A bit agressive, but for a single docker container and the NAS it works fine.

```
sudo docker rm -f nexus  
# port 8880 for docker
sudo docker run -d --restart always -p 8088:8081 -p 8880:8880 --name nexus -v nexus-data:/nexus-data sonatype/nexus3
```
