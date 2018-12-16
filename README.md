# Mount & Blade Warband Dedicated with Native

[![MicroBadger Size](https://img.shields.io/microbadger/image-size/pavolab%2Fwarband/native.svg?style=for-the-badge)](https://microbadger.com/#/images/pavolab/warband)
[![Docker Automated build](https://img.shields.io/docker/automated/pavolab/warband.svg?style=for-the-badge)](https://hub.docker.com/r/pavolab/warband/)
[![Docker Build Status](https://img.shields.io/docker/build/pavolab/warband.svg?style=for-the-badge)](https://hub.docker.com/r/pavolab/warband/)
[![GitHub](https://img.shields.io/github/license/pavolab/warband.svg?style=for-the-badge)](https://github.com/Pavolab/warband/blob/dedicated/LICENSE)

A docker image for Mount & Blade Warband dedicated with Native mod

`1.174`, `native`, `latest`, [(Native/Dockerfile)](https://github.com/Pavolab/warband/blob/master/Native/Dockerfile)

`dedicated`, [(Dedicated/Dockerfile)](https://github.com/Pavolab/warband/blob/dedicated/Dockerfile)

**NOTE**: This is only the dedicated server with Native mod. The game is available at [taleworlds.com](https://www.taleworlds.com/en/Games/Warband) and [Steam](http://store.steampowered.com/app/48700/).

## Download form Docker Hub

Generally you don't need `dedicated`, You just choose mod and then pull

```bash
docker pull pavolab/warband:native
```

## Usage

### Quick Start
```bash
docker run -d -p 7240:7240/udp -v /opt/warband:/home/warband/dedicated --name native pavolab/warband:native
```

Usually we support the following environment variables:

| Environment | Default |
| --- | --- |
| MOD | Native |
| MODE | bt |
| PASSWORD_ADMIN | passwordadmin |
| PASSWORD_PRIVATE | value | 
| SERVER_NAME | FSPNetwork | 
| WELCOME_MESSAGE | value | 
| VALVE_ANTI_CHEAT | 0 | 
| MAXPLAYERS | 32 | 
| BOTS_VOTEABLE | 20 | 
| LIMIT_TEAM_POINT | 1 | 
| LIMIT_UPLOAD | value | 
| PORT | 7240 | 
| PORT_STEAM | 7241 | 

We use the [Orion] API to generate all the config.

## Editing the Server Config

Once you have a running container, you can edit the Warband server config with `/opt/warband/config.txt`

After saving changes, restart your container with `docker restart warband-server`

**However, I recommend that you upload to `/opt/warband` after the local editing is complete.**

## Support Modules

- Native
- etc

## Upgrading the Server

First pull down the latest image:

```bash
docker pull pavolab/warband:native
```

Remove your running server container:

```bash
docker rm -f native
```

And run a new one with the same command/arguments as before.

## Credits

- [Orion] - We use the Orion API to generate all the config.

[Orion]:https://github.com/fspnet/orion