#!/usr/bin/env bash
xhost +



# define ROS_IP
machine_ip=(`hostname -I`)

until docker ps > /dev/null
do
    echo "Waiting for docker server"
    sleep 1
done


swd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
img=surgt:latest


echo "Starting container $img ..."

docker run \
      -it \
      --rm \
      --net=host \
      --pid=host \
      --env="DISPLAY" \
      --env=TERM="xterm-color"\
      --env="QT_X11_NO_MITSHM=1" \
      --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
      -v $swd/../tracking:/home/newuser/surg_t/tracking \
      -v $swd/../docker:/home/newuser/surg_t/docker \
      --name="surgt-container" \
      --privileged=True \
      $img \