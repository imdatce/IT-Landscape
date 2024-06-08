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
    zlib1g-dev \
    python3-dev

# Set working directory
WORKDIR /app

# Copy current directory contents into the container
COPY . .

# Debug: Show contents of /app
RUN ls -la /app

# Debug: Show contents of requirements.txt
RUN cat /app/requirements.txt

# Install Python dependencies with verbose output
RUN pip3 install --no-cache-dir -r /app/requirements.txt --verbose

# Run the application
CMD ["python3", "app.py"]
