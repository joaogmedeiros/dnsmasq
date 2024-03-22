<div align="center">
<a href="https://github.com/dockur/dnsmasq"><img src="https://raw.githubusercontent.com/dockur/dnsmasq/master/.github/logo.png" title="Logo" style="max-width:100%;" width="256" /></a>
</div>
<div align="center">

[![Build]][build_url]
[![Version]][tag_url]
[![Size]][tag_url]
[![Pulls]][hub_url]

</div></h1>

Docker container of dnsmasq, an open-source DNS and DHCP server.

## How to use

Via `docker-compose`

```yaml
version: "3"
services:
  dnsmasq:
    image: dockurr/dnsmasq
    container_name: dnsmasq
    environment:
      DNS1: "1.0.0.1"
      DNS2: "1.1.1.1"
    ports:
      - 53:53/udp
      - 53:53/tcp
    cap_add:
      - NET_ADMIN
    restart: on-failure
```

Via `docker run`

```bash
docker run -it --rm -p 53:53/udp -p 53:53/tcp -e "DNS1=1.0.0.1" -e "DNS2=1.1.1.1" --cap-add=NET_ADMIN dockurr/dnsmasq
```

You can set the `DNS1` and `DNS2` environment variables to change whit upstream DNS
servers to use. The examples above are the upstream DNS servers built into the default
configuration. You can read the default configuration built into the image:

```bash
docker run --rm --entrypoint "cat" "dockurr/dnsmasq" "/etc/dnsmasq.default"
...
```

You can add to or extend the default configuration with a volume that bind mounts a
directory containing `*.conf` configuration files:

    ```yaml
    volumes:
      - /example/dnsmasq.d/:/etc/dnsmasq.d/
    ```

If you need more advanced features, you can override the default configuration
completely with a volume that bind mounts a custom `dnsmasq.conf` file:

    ```yaml
    volumes:
      - /example/dnsmasq.conf:/etc/dnsmasq.conf
    ```

## Stars
[![Stars](https://starchart.cc/dockur/dnsmasq.svg?variant=adaptive)](https://starchart.cc/dockur/dnsmasq)

[build_url]: https://github.com/dockur/dnsmasq/
[hub_url]: https://hub.docker.com/r/dockurr/dnsmasq
[tag_url]: https://hub.docker.com/r/dockurr/dnsmasq/tags

[Build]: https://github.com/dockur/dnsmasq/actions/workflows/build.yml/badge.svg
[Size]: https://img.shields.io/docker/image-size/dockurr/dnsmasq/latest?color=066da5&label=size
[Pulls]: https://img.shields.io/docker/pulls/dockurr/dnsmasq.svg?style=flat&label=pulls&logo=docker
[Version]: https://img.shields.io/docker/v/dockurr/dnsmasq/latest?arch=amd64&sort=semver&color=066da5
