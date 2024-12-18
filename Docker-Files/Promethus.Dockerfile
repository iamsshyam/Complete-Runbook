# Use Ubuntu as the base image
FROM ubuntu:22.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Prometheus
RUN wget https://github.com/prometheus/prometheus/releases/download/v2.53.1/prometheus-2.53.1.linux-amd64.tar.gz \
    && tar xvfz prometheus-2.53.1.linux-amd64.tar.gz \ 
    && mv prometheus-2.53.1.linux-amd64 /usr/local/prometheus \
    && rm prometheus-2.53.1.linux-amd64.tar.gz

# Set up Prometheus configuration
COPY prometheus.yml /usr/local/prometheus/prometheus.yml

# Expose port for Prometheus
EXPOSE 9090

# Start Prometheus
CMD ["/usr/local/prometheus/prometheus", "--config.file=/usr/local/prometheus/prometheus.yml"]