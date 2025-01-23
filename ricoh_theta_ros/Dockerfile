# Use the official ROS Noetic base image
FROM ros:noetic

# Set the working directory
WORKDIR /catkin_ws

# Create the source directory
RUN mkdir src

# Copy the installation script first (if you have one)
# If you don't have an installation script, you can skip this step
# COPY install_dependencies.sh /catkin_ws/src/install_dependencies.sh
# RUN chmod +x /catkin_ws/src/install_dependencies.sh
# RUN /catkin_ws/src/install_dependencies.sh

# Copy the package files into the container
COPY . /catkin_ws/src/ricoh_theta_ros

# Install required packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-smbus2 \
    build-essential \
    i2c-tools \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip3 install smbus2

# Install ROS dependencies
RUN rosdep update && rosdep install --from-paths src --ignore-src -r -y

# Build the workspace
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && \
    catkin_make"

# Add source command to bashrc
RUN echo "source /catkin_ws/devel/setup.bash" >> /root/.bashrc

# Set the entrypoint to the ROS entrypoint script
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]