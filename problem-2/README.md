Simple Container Runtime
This directory contains a minimal implementation of a container runtime using Linux namespaces and chroot. The goal is to demonstrate how containers work under the hood, without relying on Docker or other full-featured container engines.

Features
Creates a new process isolated in its own:

Mount namespace

UTS namespace (hostname)

IPC namespace

Network namespace

PID namespace

Uses a separate root filesystem (rootfs) for the container.

Allows setting a custom hostname for the container.

Launches a shell (/bin/bash) as PID 1 inside the container.

Files
simple_container.py: The main Python script to launch the container.

ubuntu_rootfs/: The directory containing the Ubuntu root filesystem for the container. You must create this before running the script (see below).

How to Prepare the Root Filesystem
You need a minimal root filesystem (for example, Ubuntu) to use as the container's root. You can create it using debootstrap:

bash
sudo apt update
sudo apt install debootstrap
sudo debootstrap --arch=amd64 focal ./ubuntu_rootfs http://archive.ubuntu.com/ubuntu/
This will populate the ubuntu_rootfs directory.

How to Run
Run the container script as root (required for namespace and chroot operations):

bash
sudo python3 simple_container.py mycontainer
Replace mycontainer with your desired hostname.

This will launch a bash shell inside the containerized environment. You can verify isolation by checking the hostname and process tree.

Notes
You can further extend this script to add resource limits (memory, CPU) using cgroups.

This implementation is for educational purposes and lacks many security features of production container runtimes.

For more on container runtimes, see [Implementing Container Runtime Shim: runc].
