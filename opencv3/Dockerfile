#
# Docker file for image fradelg/opencv3
#
# To build:
# docker build -t fradelg/opencv3 .
#
# To run a container based on the image, allowing GUI access (unsecured way):
# xhost +
# docker run --rm -ti -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY fradelg/opencv3
#
# For a secure access method use the install.sh script

FROM ubuntu:15.04
MAINTAINER Francisco Javier Delgado del Hoyo "frandelhoyo@gmail.com"

# Update packages
ENV LAST_OS_UPDATE 2015-10-15
RUN apt-get -y update
RUN apt-get -y upgrade

# Install x11-utils to get xdpyinfo, for X11 display
RUN apt-get -y install x11-utils mesa-utils

# Install OpenCV dependencies
RUN apt-get -y install build-essential cmake git pkg-config
RUN apt-get -y install libgtk2.0-dev libavcodec-dev libavformat-dev libswscale-dev
RUN apt-get -y install python3-dev python3-tk python3-numpy
RUN apt-get -y install libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libeigen3-dev
RUN apt-get -y autoremove && apt-get -y clean

# Checkout OpenCV contrib
WORKDIR /usr/local/src
RUN git clone --branch 3.0.0 https://github.com/Itseez/opencv_contrib
WORKDIR opencv_contrib
RUN rm -rf .git

# Compile OpenCV master branch from sources
WORKDIR /usr/local/src
RUN git clone --branch 3.0.0 https://github.com/Itseez/opencv.git
WORKDIR opencv
RUN rm -rf .git
RUN mkdir build
WORKDIR build
RUN cmake -D CMAKE_BUILD_TYPE=RELEASE \
          -D BUILD_PERF_TESTS=OFF \
          -D BUILD_TESTS=OFF \
          -D BUILD_EXAMPLES=ON \
          -D INSTALL_C_EXAMPLES=ON \
          -D OPENCV_EXTRA_MODULES_PATH=/usr/local/src/opencv_contrib/modules \
          -D INSTALL_PYTHON_EXAMPLES=ON ..
RUN make -j2
RUN make install
RUN make clean

WORKDIR /usr/local/share/OpenCV/samples/python2
CMD /bin/bash
