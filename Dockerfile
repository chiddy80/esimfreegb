# Base image with V2Ray preinstalled
FROM chidvps/v2ray:latest

# Set working directory
WORKDIR /etc/v2ray

# Install performance tools and optimize system
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && echo 'net.core.rmem_max = 67108864' >> /etc/sysctl.conf \
    && echo 'net.core.wmem_max = 67108864' >> /etc/sysctl.conf \
    && echo 'net.ipv4.tcp_fastopen = 3' >> /etc/sysctl.conf

# Copy your configuration file into the container
COPY config.json /etc/v2ray/config.json

# Copy startup optimization script
COPY start.sh /etc/v2ray/start.sh
RUN chmod +x /etc/v2ray/start.sh

# Expose the port V2Ray listens on
EXPOSE 8080

# Command to start V2Ray with optimizations
CMD ["/etc/v2ray/start.sh"]
