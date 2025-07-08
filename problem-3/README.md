Simple HTTP Server (Containerized)
This directory contains a minimal HTTP server implemented in Python using Flask, along with a Dockerfile for containerization.

Features
Exposes a REST API endpoint at /api/v1/status.

Supports:

GET /api/v1/status: Returns the current status as JSON.

POST /api/v1/status: Updates the status with the provided JSON payload.

Runs on port 8000.

Files
app.py: The Flask application.

Dockerfile: Docker build instructions.

How to Build and Run
Build the Docker image:

bash
docker build -t simple-http-server .
Run the container:

bash
docker run -p 8000:8000 simple-http-server
This maps port 8000 of the container to port 8000 on your host.

Test the API:

Get status:

bash
curl http://localhost:8000/api/v1/status
Update status:

bash
curl -X POST -H "Content-Type: application/json" -d '{"status":"Updated"}' http://localhost:8000/api/v1/status
Notes
You can modify app.py to add more endpoints or logic as needed.

This example demonstrates how to containerize a Python web application for deployment in cloud-native environments.

For production, consider adding a production-ready WSGI server (e.g., gunicorn) and proper error handling.

If you need further customization or more advanced examples, let me know!
