FROM python:3.12-alpine

WORKDIR /app
COPY app/server.py ./server.py

EXPOSE 8080
CMD ["python", "server.py"]
