# Use a lightweight base image, like Alpine, which is ideal for simple scripts.
FROM alpine:latest


# Install Python and any necessary dependencies.
RUN apk add --no-cache python3 py3-pip

# Set the working directory inside the container.
WORKDIR /app

# Copy the script from your local machine into the container's /app directory.
COPY test.py .

# Make the script executable. This is the crucial step you need to add.
RUN chmod +x ./test.py


# Define the command to run when the container starts.
# The 'CMD' instruction is used to provide default arguments for an executing container.
CMD ["python3", "/app/test.py"]