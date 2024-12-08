<div align="center">
<a href="https://github.com/dockur/dnsmasq"><img src="https://raw.githubusercontent.com/dockur/dnsmasq/master/.github/logo.png" title="Logo" style="max-width:100%;" width="256" /></a>
</div>
<div align="center">


</div></h1>

Docker container of [dnsmasq](https://thekelleys.org.uk/dnsmasq/doc.html), an open-source DNS server.
Forked from [dockurr/dnsmasq](https://github.com/dockur/dnsmasq) repository.

## Usage  🐳

Via Docker Compose:

```yaml
services:
  dnsmasq:
    build: .
    container_name: dnsmasq
    environment:
      DNS: "1.0.0.1"
    ports:
      - 53:53/udp
      - 53:53/tcp
    cap_add:
      - NET_ADMIN
```

Via Docker CLI:

```bash
docker build -t dnsmasq-unbound .
docker run -it --rm -p 53:53/udp -p 53:53/tcp -e "DNS=1.0.0.1" --cap-add=NET_ADMIN dnsmasq-unbound
```

