# Use a lightweight base image, like Alpine, which is ideal for simple scripts.
FROM alpine:latest

# Set the working directory inside the container.
WORKDIR /app

# Copy the script from your local machine into the container's /app directory.
COPY testing.sh .

# Make the script executable. This is the crucial step you need to add.
RUN chmod +x ./testing.sh

# Install bash before trying to use it
RUN apk add --no-cache bash

# Define the command to run when the container starts.
# The 'CMD' instruction is used to provide default arguments for an executing container.
CMD ["bash", "/app/testing.sh"]