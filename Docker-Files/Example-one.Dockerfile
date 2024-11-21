# Difference Between CMD and ENTRYPOINT
# CMD: Provides default arguments to the container that can be overridden at runtime.
# ENTRYPOINT: Defines the command that always runs, and can accept additional arguments.

# Use Ubuntu as the base image
FROM ubuntu:latest

# Set up an environment variable
ENV APP_MSG="Hello World"

# CMD example (can be overridden at runtime)
CMD ["echo", "$APP_MSG"]

# ENTRYPOINT example (runs as default command)
ENTRYPOINT ["echo", "ENTRYPOINT is set to run this message"]