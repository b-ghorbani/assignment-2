FROM python:3.12-slim-bookworm
WORKDIR /app
COPY app.py .
RUN pip install flask
EXPOSE 8000
CMD ["python", "app.py"]

