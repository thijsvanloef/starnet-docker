# Starnet++ Docker

A containerized variant of the [Starnet++](https://www.starnetastro.com/) application

I've made this image to be able to use Starnet++ quickly without needing to install the application locally.+

Please note, I'm not the creator of starnet++ for support go to [the Starnet++ website](https://www.starnetastro.com/)

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
