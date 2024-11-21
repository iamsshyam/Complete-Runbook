# Use a smaller Alpine-based Python image
FROM python:3.9-alpine
WORKDIR /app

# Copy dependencies file and install without cache
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt && \
    rm -rf /var/cache/apk/*

# Copy the rest of the application
COPY . .

# Run the app
CMD ["python", "app.py"]
