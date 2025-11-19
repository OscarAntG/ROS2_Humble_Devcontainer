
ROS2 Humble Dev Container Workspace

Development Environment for ROS2 Humble + Ubuntu 22.04 + Foxglove Studio + Colcon

This repository contains a Dev Container that sets up a ROS2 Humble development environment inside VS Code. It includes ROS 2 Humble, Foxglove Studio, and a ready to use workspace structure.

INSTALLATION INSTRUCTIONS

**Install Docker Engine (Ubuntu 24.04)**  
    
    sudo apt update
    sudo apt install -y ca-certificates curl gnupg lsb-release
    
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
      https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

Add your user to docker group:    
    ```
    sudo usermod -aG docker $USER
    ```

Reboot.

**Clone the repository.**
    
    
    git clone https://github.com/OscarAntG/ROS2_Humble_Devcontainer.git dw_ros2_ws
    cd dw_ros2_ws
    

**Install the VS Code Dev Container extension**

Open VS Code
Install: Dev Containers (ms-vscode-remote.remote-containers)

**Open the project in VS Code**
    
    
    code ~/dw_ros2_ws
    

Select "Reopen in container" on the bottom right prompt in VS Code.
You're now inside your dev environment.
