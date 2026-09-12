## ROS 2 Humble + Gazebo Fortress Docker 环境

本项目使用 Docker 构建一个 ROS 2 Humble + Gazebo Fortress 的开发环境，宿主机无需直接安装 ROS 2 和 Gazebo。

### 首次启动

第一次使用，或者修改了 Dockerfile / docker-compose.yml 后，需要重新构建。

首先进入项目目录终端执行（提示权限不足就在每一条前面加```sudo```）：

```
xhost +local:docker
docker compose build
docker compose up -d
```

### 使用容器

```
docker exec -it ros2_humble_gazebo bash
ign gazebo
```

### 其他操作

```
docker compose start //启动容器
docker compose stop //关闭容器
docker compose down //删除容器
```
