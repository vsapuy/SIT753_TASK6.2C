FROM python:3.9-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3-pip \
    wget \
    curl \
    unzip \
    firefox-esr \
    && rm -rf /var/lib/apt/lists/*

# Install Geckodriver
RUN wget -O /tmp/geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-linux64.tar.gz \
    && tar -xzf /tmp/geckodriver.tar.gz -C /usr/local/bin/ \
    && rm /tmp/geckodriver.tar.gz \
    && chmod +x /usr/local/bin/geckodriver

# Set environment variables for Firefox
ENV FIREFOX_BIN=/usr/bin/firefox
ENV GECKO_DRIVER=/usr/local/bin/geckodriver

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
