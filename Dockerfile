# Base image with V2Ray preinstalled
FROM chidvps/v2ray:latest

# Set working directory
WORKDIR /etc/v2ray

# Copy your configuration file into the container
COPY config.json /etc/v2ray/config.json

# Expose the port V2Ray listens on
EXPOSE 8080

# Command to start V2Ray
CMD ["v2ray", "run", "-config", "/etc/v2ray/config.json"]
