#! /bin/bash

# Pass X11 session variables to allow GUI access from the container
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run --name="fradelg-opencv3" \
  --privileged \
	-v $XSOCK:$XSOCK:rw \
	-v $XAUTH:$XAUTH:rw \
  -v /dev/video0:/dev/video0 \
  --device=/dev/dri/card0:/dev/dri/card0 \
	-e DISPLAY=$DISPLAY \
	-e XAUTHORITY=$XAUTH \
	-i -it fradelg/opencv3
