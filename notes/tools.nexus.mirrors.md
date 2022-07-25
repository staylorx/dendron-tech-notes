---
id: szlb6ma4pbf2mbt9vw4gk8r
title: Mirrors
desc: ''
updated: 1658785646636
created: 1658775728845
---

## Mirror PyPi, for instance

Create the following in a `pip.ini` or `pip.conf` file. In Conda&mdash;where I tend to use this the most&mdash;place the file in each environment folder and it works great.

```
[global]
use-mirrors=true
mirrors=http://192.168.1.11:8088/repository/pypi/
index-url=http://192.168.1.11:8088/repository/pypi/simple/
trusted-host=192.168.1.11
```

## local registry conf for podman containers folder

_Note the 8880 has been configured as a docker repo, not a normal maven, npm, or yum repo. Those are on 8088_

```
#/etc/containers/registries.conf

#...
[registries.search]
registries = ['192.168.1.11:8880']

[registries.insecure]
registries = ['192.168.1.11:8880']
#...
```

Once this is configured, I run a script (here: [[assets\files\cache_images.sh]]) from time to time to ensure I have the latest versions in the proxy. 
