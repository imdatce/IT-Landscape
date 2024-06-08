# Base image
FROM ubuntu:latest

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    build-essential \
    libpq-dev \
    libssl-dev \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev

# Set working directory
WORKDIR /app

# Copy current directory contents into the container
COPY . /app

# Debug: Show contents of /app
RUN ls -la /app

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Run the application
CMD ["python3", "app.py"]
