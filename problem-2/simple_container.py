import os
import sys
import subprocess

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 simple_container.py <hostname>")
        exit(1)
    hostname = sys.argv[1]
    rootfs = "./ubuntu_rootfs" 

    subprocess.run([
        "unshare", "--mount", "--uts", "--ipc", "--net", "--pid", "--fork",
        "--mount-proc",
        "chroot", rootfs, "/bin/bash", "-c", f"hostname {hostname}; exec /bin/bash"
    ])

if __name__ == "__main__":
    main()

