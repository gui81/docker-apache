docker-apache
=============

# Table of Contents

- [Introduction](#introduction)
  - [Version](#version)
- [Contributing](#contributing)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Configuration](#configuration)
  - [Datastore](#datastore)
- [References](#references)

# Introduction
Dockerfile to build an apache container image.

## Version
This docker image is based on CentOS 7, which uses Apache 2.4.

# Contributing
Here is how you can help:
- Send a Pull Request with your awesome new features and bug fixes
- Report [Issues](https://github.com/gui81/docker-apache/issues)

# Installation
Pull the image from the docker index.
```bash
docker pull gui81/apache
```

Alternatively, you can build the image yourself:
```bash
git clone https://github.com/gui81/docker-apache.git
cd docker-apache
docker build --tag="$USER/apache" .
```

# Quick Start
Run the apache image with the name "apache".

```bash
docker run --name='apache' -it --rm -p 80:80 -p 443:443 gui81/apache
```

**NOTE**: Please allow a few minutes for the application to start.

Go to `http://localhost` or point to the ip of your docker server.  On the
Mac, if you are running boot2docker, then you can go to the ip reported by:

```bash
boot2docker ip
```

If you want to use this image in production, then please read on.

# Configuration
## Datastore
To persist data, you will want to make sure to mount the volume shared by the
image.  The following volumes are shared:
* `/etc/httpd/conf`
* `/etc/httpd/conf.d`
* `/etc/httpd/conf.modules.d`
* `/etc/httpd/vhosts.d`
* `/var/www`
* `/var/log/httpd`

Volumes can be mounted by passing the **'-v'** option to the docker run command.
The following is an example:
```bash
docker run --name apache -it --rm -p 80:80 -p 443:443 \
    -v /host/apache/conf:/etc/httpd/conf \
    -v /host/apache/conf.d:/etc/httpd/conf.d \
    -v /host/apache/conf.modules.d:/etc/httpd/conf.modules.d \
    -v /host/apache/vhosts.d:/etc/httpd/vhosts.d \
    -v /host/apache/www:/var/www \
    -v /host/apache/log:/var/log/httpd \
    gui81/apache
```

**NOTE**: You might want to bootstrap your configs in the host by running the
container and mounting /host/apache:/host.  Then docker exec into the running
image and copy the files into the appropriate /host directories.  After that
you can shut down the container and run it again with the mount points as listed
in the above example.

# References
* http://httpd.apache.org/
* http://www.centos.org/
