# Simple HTTP Server (Containerized)

This directory contains a minimal HTTP server implemented in Python using Flask, along with a Dockerfile for containerization.

## Features

- **REST API Endpoint:**  
  Exposes `/api/v1/status`.

- **Supported Methods:**
  - `GET /api/v1/status` — Returns the current status as JSON.
  - `POST /api/v1/status` — Updates the status with the provided JSON payload.

- **Port:**  
  Runs on port **8000**.

## Files

| File        | Description                        |
|-------------|------------------------------------|
| `app.py`    | The Flask application.             |
| `Dockerfile`| Docker build instructions.         |

## How to Build and Run

### 1. Build the Docker Image

```bash
docker build -t simple-http-server .
```

### 2. Run the Container

```bash
docker run -p 8000:8000 simple-http-server
```
This maps port 8000 of the container to port 8000 on your host.

## How to Test the API

### Get Status

```bash
curl http://localhost:8000/api/v1/status
```

### Update Status

```bash
curl -X POST -H "Content-Type: application/json" -d '{"status":"Updated"}' http://localhost:8000/api/v1/status
```

## Notes

- You can modify `app.py` to add more endpoints or logic as needed.
- This example demonstrates how to containerize a Python web application for deployment in cloud-native environments.
- For production, consider adding a production-ready WSGI server (e.g., **gunicorn**) and proper error handling.

**Tip:**  
For further customization or more advanced examples, feel free to ask!
