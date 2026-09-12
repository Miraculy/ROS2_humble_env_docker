FROM osrf/ros:humble-desktop-full

ENV DEBIAN_FRONTEND=noninteractive

# ============================================================
# Ubuntu 22.04 软件源换清华源
# ============================================================

RUN sed -i 's@http://archive.ubuntu.com/ubuntu/@https://mirrors.tuna.tsinghua.edu.cn/ubuntu/@g' \
    /etc/apt/sources.list && \
    sed -i 's@http://security.ubuntu.com/ubuntu/@https://mirrors.tuna.tsinghua.edu.cn/ubuntu/@g' \
    /etc/apt/sources.list


# ============================================================
# 添加 Gazebo 官方软件源
# ============================================================

RUN apt update && \
    apt install -y \
        curl \
        lsb-release \
        gnupg && \
    curl https://packages.osrfoundation.org/gazebo.gpg \
        --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] https://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" \
        > /etc/apt/sources.list.d/gazebo-stable.list


# ============================================================
# 安装 Gazebo Fortress + ROS 2 工具
# ============================================================

RUN apt update && apt install -y \
    ignition-fortress \
    ros-humble-ros-gz \
    ros-humble-gz-ros2-control \
    ros-humble-ros2-control \
    ros-humble-ros2-controllers \
    ros-humble-navigation2 \
    ros-humble-nav2-bringup \
    ros-humble-slam-toolbox \
    ros-humble-xacro \
    ros-humble-joint-state-publisher \
    ros-humble-joint-state-publisher-gui \
    ros-humble-robot-state-publisher \
    git \
    nano \
    vim \
    wget \
    curl \
    python3-pip \
    mesa-utils \
    && rm -rf /var/lib/apt/lists/*


# ============================================================
# 自动加载 ROS 环境
# ============================================================

RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc


# ============================================================
# 创建 ROS 2 工作空间
# ============================================================

RUN mkdir -p /root/ros2_ws/src

WORKDIR /root/ros2_ws

CMD ["bash"]