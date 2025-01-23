#!/bin/bash

# Update package list
apt-get update -y

# Install required system packages
apt-get install -y \
    python3 \
    python3-pip \
    build-essential \
    ros-noetic-catkin \
    python3-catkin-tools \
    i2c-tools \  # Added for I2C support
    python3-smbus2  # Added for SMBus support

# Install Python dependencies
pip3 install smbus2

# Install ROS dependencies
rosdep install --from-paths src --ignore-src -r -y