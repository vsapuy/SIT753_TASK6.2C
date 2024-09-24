FROM python:3.9-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3-pip \
    wget \
    curl \
    unzip \
    chromium \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables for Chromium
ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROME_DRIVER=/usr/lib/chromium-browser/chromedriver

# Copy the app code
WORKDIR /app
COPY . /app

# Install Python dependencies
RUN pip install -r requirements.txt

# Expose the port
EXPOSE 5000

ENV NAME dbm-calc-app
# Run the Flask app
CMD ["python", "app.py"]







# # Use an official Python runtime as a parent image
# FROM python:3.9-slim

# # Set the working directory in the container 
# WORKDIR /usr/src/app

# # Copy the current directory contents into the container at /usr/src/app
# COPY . .

# # Install any needed dependencies specified in requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt

# # Make port 80 available to the world outside this container
# EXPOSE 80

# # Define environment variable
# ENV NAME dbm-calc-app

# # Run the application when the container launches
# CMD ["python", "app.py"]
