FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    lsb-release \
    sudo \
    gnupg2 \
    locales \
    software-properties-common \
    dbus-x11 \
    terminator

RUN locale-gen en_US en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Add ROS 2 repository
RUN apt-get update && apt-get install -y \
    software-properties-common

RUN add-apt-repository universe

# Add ROS key
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key \
    | apt-key add -

# Add sources list
RUN sh -c 'echo "deb http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2.list'

# Install ROS 2 Humble desktop
RUN apt-get update && apt-get install -y ros-humble-desktop

# Source ROS 2 on container startup
RUN echo "source /opt/ros/humble/setup.bash" >> /etc/bash.bashrc

# Install Foxglove
RUN wget -O /tmp/foxglove.deb \
    https://github.com/foxglove/studio/releases/download/v2.9.0/foxglove-studio-2.9.0-linux-amd64.deb && \
    apt-get install -y /tmp/foxglove.deb && \
    rm /tmp/foxglove.deb

# Create a user
ARG USERNAME=dev
ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID $USERNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME && \
    usermod -aG sudo $USERNAME && \
    echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER $USERNAME

WORKDIR /home/$USERNAME

RUN sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*

