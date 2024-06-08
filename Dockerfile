# Base image
FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

# Set working directory
WORKDIR /app

# Copy current directory contents into the container
COPY . /app

# Install Python dependencies
RUN pip3 install -r requirements.txt

# Run the application
CMD ["python3", "app.py"]
