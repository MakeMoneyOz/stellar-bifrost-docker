# Stellar Bifrost on Docker

This builds a Docker image of with Stellar Bifrost.

## Configuration

- Config file is expected to be in `/opt/bifrost/config/bifrost.cfg`
- Data directory, where this image saves states is `/opt/bifrost/data`. This must live in between deploys, so it should not be an ephemeral volume.
- See `docker-compose.yml` bifrost's environment to see what environment vars can be set.

## Build the Docker Image.

    $ git clone https://github.com/MakeMoneyOz/stellar-bifrost-docker.git
    $ cd stellar-bifrost-docker
    $ docker-compose build bifrost
 
## Run the Docker Image.

    $ docker-compose up

## Remove/Delete the Docker Image.

    $ docker-compose down -v

## Other

- We build this on Google Cloud. You will find an example in `cloudbuild/`.
- Until bifrost can do its own migrations, this `entry.sh` manages this.
- `entry.sh`, `initbifrost` lifted from [StellarKit](https://github.com/StellarKit/stellar-bifrost)
- Thanks to `bloom-solutions/stellar-bifrost-docker` for help ^_^

## License

MIT
