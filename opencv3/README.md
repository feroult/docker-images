# OpenCV 3 - Docker image

A docker image for OpenCV 3.0.0 based on Ubuntu 15.04.

It includes the python and C++ examples to play with them.

## Build

`docker build -t fradelg/opencv3 .`

## Container

OpenCV examples require access to window system in order to show images and GUI elements.

To create a container with GUI access just execute the `install.sh` script.

Then, you can boot the container by just writing

`docker start -i fradelg-opencv3`

The `-i` flag launch the bash shell after booting the docker container
