# Use an official Ubuntu runtime as a parent image
FROM ubuntu:20.04

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Install rsyslog
RUN apt-get update && apt-get install -y rsyslog

# Copy rsyslog configuration
COPY rsyslog.conf /etc/rsyslog.conf

# Start rsyslogd
CMD ["rsyslogd", "-n"]

# Expose port
EXPOSE 514
