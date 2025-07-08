# Simple Container Runtime

This directory contains a minimal implementation of a container runtime using Linux namespaces and `chroot`. The goal is to demonstrate how containers work under the hood, without relying on Docker or other full-featured container engines.

## Features

- **Process Isolation:**  
  Launches a new process isolated in its own:
  - **Mount namespace**
  - **UTS namespace** (custom hostname)
  - **IPC namespace**
  - **Network namespace**
  - **PID namespace**

- **Separate Root Filesystem:**  
  Uses a dedicated root filesystem (`rootfs`) for the container.

- **Custom Hostname:**  
  Allows setting a user-defined hostname for the container.

- **Shell as PID 1:**  
  Launches `/bin/bash` as PID 1 inside the container.

## Files

| File/Directory      | Description                                                      |
|---------------------|------------------------------------------------------------------|
| `simple_container.py` | Main Python script to launch the container.                      |
| `ubuntu_rootfs/`      | Directory containing the Ubuntu root filesystem for the container. You must create this before running the script. |

## How to Prepare the Root Filesystem

You need a minimal root filesystem (for example, Ubuntu) to use as the container's root. You can create it using `debootstrap`:

```bash
sudo apt update
sudo apt install debootstrap
sudo debootstrap --arch=amd64 focal ./ubuntu_rootfs http://archive.ubuntu.com/ubuntu/
```

This will populate the `ubuntu_rootfs` directory with a minimal Ubuntu filesystem.

## How to Run

Run the container script as root (required for namespace and `chroot` operations):

```bash
sudo python3 simple_container.py mycontainer
```

- Replace `mycontainer` with your desired hostname.

This will launch a bash shell inside the containerized environment. You can verify isolation by checking the hostname and process tree (e.g., with `hostname` and `ps` inside the container).

## Notes

- You can further extend this script to add resource limits (memory, CPU) using cgroups.
- This implementation is for educational purposes and lacks many security features of production container runtimes.
- For more on container runtimes, see documentation and examples for tools like `runc`.

**Tip:**  
Always run the script as `root` to ensure all namespaces and `chroot` operations succeed. For advanced isolation or resource control, consider integrating cgroup configuration or seccomp profiles.
