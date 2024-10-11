# Use a lightweight base image like Ubuntu
FROM ubuntu:latest

# Update and install necessary tools like gzip
RUN apt-get update && apt-get install -y gzip

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the log_rotation.sh script into the container
COPY log_rotation.sh .

# Make the log_rotation.sh script executable
RUN chmod +x log_rotation.sh

# Define the default command that runs when the container starts
CMD ["./log_rotation.sh"]
