# https://book.getfoundry.sh/tutorials/foundry-docker?highlight=docker#creating-a-build-and-test-image
FROM ghcr.io/foundry-rs/foundry:latest

# Copy our source code into the container
WORKDIR /app

# Build and test the source code
COPY ./app /app
RUN forge build

ENTRYPOINT [ "make" ]