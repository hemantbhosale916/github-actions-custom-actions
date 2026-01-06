# Use official GitHub Actions toolkit image
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    curl \
    unzip \
    git \
    docker.io \
    awscli \
    && rm -rf /var/lib/apt/lists/*

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
