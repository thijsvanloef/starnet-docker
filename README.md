# Starnet++ Docker

![Release](https://img.shields.io/github/v/release/thijsvanloef/starnet-docker)
![Docker Pulls](https://img.shields.io/docker/pulls/thijsvanloef/starnet-docker)
![Docker Stars](https://img.shields.io/docker/stars/thijsvanloef/starnet-docker)
![Image Size](https://img.shields.io/docker/image-size/thijsvanloef/starnet-docker/latest)

[View on Docker Hub](https://hub.docker.com/repository/docker/thijsvanloef/starnet-docker)

A containerized variant of the [Starnet++](https://www.starnetastro.com/) application

I've made this image to be able to use Starnet++ quickly without needing to install the application locally.+

Please note, I'm not the creator of starnet++ for support go to [the Starnet++ website](https://www.starnetastro.com/)

## Why Docker

Docker allows you to use Starnet++ without installing it. All the files and dependancies you need are already present in the container and will not require installation.

This Docker container also allows batch processing of images, meaning if you put multiple files in the input folder, it will sequentially process your .TIFF files.
I am currently still working on enableling parallel image processing making the overall process take less time.

## How to use

First create 2 folders:

* **input**: an "input" folder in which you have the `.tif` files you wish to use.
* **output**: an "output" folder which the processed `.tif` files will be output.

After creating the folders you can use this image using Docker run.

### docker run

```bash
docker run \
    -v /path/to/input:/home/starnet/application/input \
    -v /path/to/output:/home/starnet/application/output \ 
    thijsvanloef/starnet-docker:latest
```
