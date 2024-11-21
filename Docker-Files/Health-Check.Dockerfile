FROM nginx:latest

# Copy custom Nginx config if needed
COPY nginx.conf /etc/nginx/nginx.conf

# Setting up a health check command
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -f http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
