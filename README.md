بله، داشتن یک فایل README کلی در ریشه مخزن (repo) برای معرفی پروژه و توضیح اجمالی هر سه تمرین کاملاً توصیه می‌شود. این کار باعث می‌شود داور یا هر فرد دیگری که وارد مخزن می‌شود، سریعاً با ساختار پروژه، هدف هر بخش و نحوه اجرای کلی آشنا شود. در ادامه یک نمونه README کلی برای ریشه مخزن آورده شده است که می‌توانید آن را شخصی‌سازی و استفاده کنید.

# Assignment 2 — Cloud-Native Software-Defined Mobile Networks

This repository contains solutions for three practical exercises on container networking, minimal container runtime, and containerized HTTP services. Each problem is organized in a separate directory with its own code, scripts, and documentation.

## Directory Structure

```
assignment-2/
├── problem-1/    # Container Networking with Network Namespaces
├── problem-2/    # Simple Container Runtime Implementation
├── problem-3/    # Containerized HTTP Server
└── link.txt      # Repository link for submission
```

## Problem Overview

### 1. Container Networking (problem-1)

- **Goal:**  
  Build a network topology using Linux network namespaces and bridges, simulating nodes and a router.
- **Scripts:**  
  - `create_topology.sh`: Sets up the network topology.
  - `ping_nodes.sh`: Tests connectivity between nodes.
- **Docs:**  
  - `Q2_without_router.md`: What happens if the router is removed.
  - `Q3_different_servers.md`: How to connect namespaces on different servers.
- **How to run:**  
  See `problem-1/README.md` for details.

### 2. Simple Container Runtime (problem-2)

- **Goal:**  
  Implement a minimal container runtime using Linux namespaces and chroot.
- **Files:**  
  - `simple_container.py`: Main script to launch an isolated container.
  - `ubuntu_rootfs/`: Minimal Ubuntu root filesystem (created via debootstrap).
- **How to run:**  
  See `problem-2/README.md` for setup and execution instructions.

### 3. Containerized HTTP Server (problem-3)

- **Goal:**  
  Build and run a simple Flask-based HTTP server inside a Docker container.
- **Files:**  
  - `app.py`: Flask application.
  - `Dockerfile`: Build instructions.
- **How to run:**  
  See `problem-3/README.md` for Docker build and API usage.

## How to Use This Repository

1. **Clone the repository:**
   ```bash
   git clone 
   cd assignment-2
   ```
2. **Follow the instructions in each problem's directory for setup and execution.**
3. **For submission:**  
   The file `link.txt` contains the public URL of this repository.

## Notes

- Each problem is self-contained with its own documentation and scripts.
- Please read the README in each subdirectory for detailed setup and usage.
- Make sure your repository is public and does not contain any sensitive information.
- Commit your changes in logical steps and avoid pushing after the deadline.

You can copy and adapt this template as your main `README.md` in the root of your repository. This will give reviewers a clear overview and easy navigation for all three exercises.
