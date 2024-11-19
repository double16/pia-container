# pia-container
[![GitHub Issues](https://img.shields.io/github/issues-raw/double16/pia-container.svg)](https://github.com/double16/pia-container/issues)
[![Build](https://github.com/double16/pia-container/workflows/Build/badge.svg)](https://github.com/double16/pia-container/actions?query=workflow%3ABuild)
[![](https://img.shields.io/badge/Donate-Buy%20me%20a%20coffee-orange.svg)](https://www.buymeacoffee.com/patDj)

Runs Private Internet Access VPN to provide Internet access to other containers.

You must have a [Private Internet Access](https://privateinternetaccess.com) account for this to work. The `pia`
volume is used to hold credentials. The `/config/pia-auth.conf` contains the username on line 1 and password on line 2.

Example docker-compose.yml:

```yaml
volumes:
  config:
  piaetc:

services:
  pia:
    image: ghcr.io/double16/pia-container:main
    restart: unless-stopped
    cap_add:
      - NET_ADMIN
    dns:
      - 8.8.8.8
      - 8.8.4.4
    volumes:
      - config:/config
      - piaetc:/opt/piavpn/etc

  client1:
    image: ubuntu
    restart: unless-stopped
    network_mode: "service:pia"
    depends_on:
      - pia
```

After bring up the compose file below you could run the following:

```shell
$ docker exec -it pia_1 /bin/sh
# cat >/config/pia-auth.conf <<EOF
username
password
EOF
# exit
```

If the pia container is restarted, it may be necessary to restart the client containers to correct the docker
network routing. If you know how to fix this, create an issue or pull request with documentation.
