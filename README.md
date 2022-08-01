# Starnet++ Docker

![Release](https://img.shields.io/github/v/release/thijsvanloef/starnet-docker)
![Docker Pulls](https://img.shields.io/docker/pulls/thijsvanloef/starnet-docker)
![Docker Stars](https://img.shields.io/docker/stars/thijsvanloef/starnet-docker)
![Image Size](https://img.shields.io/docker/image-size/thijsvanloef/starnet-docker/latest)

[View on Docker Hub](https://hub.docker.com/repository/docker/thijsvanloef/starnet-docker)

[View the Wiki for more information](https://github.com/thijsvanloef/starnet-docker/wiki) :books:

A containerized variant of the [Starnet++](https://www.starnetastro.com/) application.

I've made this image to be able to use Starnet++ quickly without needing to install the application locally.

Please note, I'm not the creator of starnet++ for support go to [the Starnet++ website](https://www.starnetastro.com/).

## Why Docker

Docker allows you to use Starnet++ without installing it. All the files and dependencies you need are already in the container and will not require installation.

## How to use



First create 2 folders:

- **input**: an "input" folder in which you have the `.tif` files you wish to use.
- **output**: an "output" folder which the processed `.tif` files will be output.

### CPU Processing

After creating the folders, you can use this image using Docker run.

```bash
docker run \
    -v /path/to/input:/home/starnet/application/input \
    -v /path/to/output:/home/starnet/application/output \
    -e PARALLEL=false \
    -e STRIDE=128 \
    thijsvanloef/starnet-docker:latest
```

### GPU Processing

After creating the folders, you can use this image using Docker run.

```bash
docker run \
    -v /path/to/input:/starnet/input \
    -v /path/to/output:/starnet/output \
    --gpus=all
    -e PARALLEL=false \
    -e STRIDE=128 \
    thijsvanloef/starnet-docker:latest
```

### Environment variables

| Option      | Description | Default Value |
| ----------- | ----------- | ----------- |
| PARALLEL      | Run the processing in parallel or not. It will run sequentially by default.       | false       |
| STRIDE   | The stride setting controls how it computes the starless image. It computes a single block of pixels at a time and then repeats until it has finished the image. With a large setting, it works on fewer larger blocks of pixels. In a smaller setting, it works on more blocks of fewer pixels. A large setting can produce blocky results on large stars. On the other hand, a small setting will take WAY more computer time, so it is a tradeoff.       | 128        |

## Batch processing

This Docker container also allows batch processing of images, meaning if you put multiple files in the input folder, it will sequentially process your .TIFF files.

There is also the option of running the process in parallel, which means it will try to process all the images simultaneously. Running in parallel might result in heavy CPU/GPU usage.

### Sequentially

By default, the images will be processed sequentially, meaning it will process an image and move on to the next one if the processing of that image is done.

This will result in less CPU usage, but the CPU usage will heavily fluctuate and can take longer to process if you batch-process images.

#### Sequentual Test results

Limited testing was performed during the development of the image.

- Number of files: 10
- Bits per sample: 16
- Samples per pixel: 3
- Height: 712
- Width: 1048
- Stride: 128

Results:

- Total processing time: 160 - 170 seconds
- CPU: heavy CPU fluctuations
- CPU LOAD: 95% max

### Parallel

By default, the images will be processed sequentially, but you have the option to process the images in parallel, meaning that the container will try to process all images at once.

This will result in more sustained CPU usage but will take less time for it to process all files.

#### Parallel Test results

Limited testing was performed during the development of the image.

- Number of files: 10
- Bits per sample: 16
- Samples per pixel: 3
- Height: 712
- Width: 1048
- Stride: 128

Results:

- Total processing time: 130 - 140 seconds
- CPU: no CPU fluctuations
- CPU LOAD: 100%
