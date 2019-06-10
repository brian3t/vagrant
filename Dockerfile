# Use an official Python runtime as a parent image
FROM ubuntu:cosmic

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

RUN apt-get update && \
      apt-get -y install sudo
RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y python python-pip python-dev

CMD /bin/bash

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD tail -f /dev/null