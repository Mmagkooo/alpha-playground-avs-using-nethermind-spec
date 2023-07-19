# AVS Registration Plugin

This plugin is a forge repo that is meant to be used to interact with the AVS contracts for registration, stake updates, etc.

TODO: currently doesn't work when installing via nethermind-cli because the commands in the [Makefile](./app/Makefile) need to persist the contract deployment addresses in a file, but the nethermind-cli doesn't seem to give any option to mount a local volume when running the plugin.

## How to build the image

Execute the following command from the plugin folder:

```bash
docker build . -t <image_tag>
```

Replace `<image_tag>` with the desired tag for the plugin image.

## How to run the plugin container

```
docker run --rm -p <your_port>:8045 --network <avs_docker_network> --host <host> --port <port>
```

Make sure to replace `<your_port>` with the port you want to expose in your machine. `<avs_docker_network>` must be the same docker network that the AVS instance you want to check is using.

For a quick run, you can check a mock AVS instance running with the default values of the `health-checker` profile:

```
docker build . -t avs-plugin
docker run --rm -p 8045:8045 --network eigenlayer avs-plugin --host main-service --port 8090
```
