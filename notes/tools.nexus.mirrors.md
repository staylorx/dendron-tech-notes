---
id: szlb6ma4pbf2mbt9vw4gk8r
title: Mirrors
desc: ''
updated: 1659538007511
created: 1658775728845
---

## Mirror Maven repos for Gradle

In the `$USERHOME/.gradle/init.gradle` file,

```
allprojects {
    buildscript {
        repositories {
            mavenLocal()
            maven { 
                url "http://192.168.1.11:8088/repository/maven-public/" 
                allowInsecureProtocol = true
            }
        }
    }

    repositories {
        mavenLocal()
        maven { 
            url "http://192.168.1.11:8088/repository/maven-public/" 
            allowInsecureProtocol = true
        }
    }
}
```

## Mirror PyPi, for instance

Create the following in a `pip.ini` or `pip.conf` file. In Conda&mdash;where I tend to use this the most&mdash;place the file in each environment folder and it works great.

```ini
[global]
use-mirrors=true
mirrors=http://192.168.1.11:8088/repository/pypi/
index-url=http://192.168.1.11:8088/repository/pypi/simple/
trusted-host=192.168.1.11
```

## local registry conf for podman containers folder

_Note the 8880 has been configured as a docker repo, not a normal maven, npm, or yum repo. Those are on 8088_

```ini
#/etc/containers/registries.conf

#...
[registries.search]
registries = ['192.168.1.11:8880']

[registries.insecure]
registries = ['192.168.1.11:8880']
#...
```

## Docker desktop on Windows

```json
{
  "builder": {
    "gc": {
      "defaultKeepStorage": "20GB",
      "enabled": true
    }
  },
  "experimental": false,
  "features": {
    "buildkit": true
  },
  "insecure-registries": [
    "192.168.1.11"
  ],
  "max-concurrent-downloads": 1,
  "registry-mirrors": [
    "http://192.168.1.11:8880"
  ]
}
```


Once this is configured, I run a script (here: [[assets\files\cache_images.sh]]) from time to time to ensure I have the latest versions in the proxy. 
