# Stellar Bifrost on Docker

This builds a Docker image of with Stellar Bifrost.

## Configuration

- Config file is expected to be in `/opt/bifrost/config/bifrost.cfg`
- Data directory, where this image saves states is `/opt/bifrost/data`. This must live in between deploys, so it should not be an ephemeral volume.
- See `docker-compose.yml` bifrost's environment to see what environment vars can be set.

## Install Dependencies (based on Ubuntu 16.04) 

- This will update and install all pre-required depencencies on your server. This will also clone this repo.

      $ apt-get update && apt-get upgrade -yy && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && sudo apt-get update && apt-cache policy docker-ce && sudo apt-get install -y docker-ce && sudo systemctl status docker && sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose && apt-get install git -y && git clone https://github.com/MakeMoneyOz/stellar-bifrost-docker.git

## Build the Docker Image.

    $ git clone https://github.com/MakeMoneyOz/stellar-bifrost-docker.git
    $ cd stellar-bifrost-docker
    $ docker-compose build bifrost
    $ apt-get update && apt-get upgrade -yy && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && sudo apt-get update && apt-cache policy docker-ce && sudo apt-get install -y docker-ce && sudo systemctl status docker && sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose && apt-get install git -y && git clone https://github.com/MakeMoneyOz/stellar-bifrost-docker.git

 
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
