#!/usr/bin/env bash
set -Eeuo pipefail

# Define Unbound configuration path
unbound_conf="/etc/unbound/unbound.conf"

# Create the Unbound configuration
cat <<EOF > "$unbound_conf"
server:
  interface: 0.0.0.0@5353
  access-control: 0.0.0.0/0 allow
  forward-zone:
    name: "."
    forward-addr: ${DNS}
    forward-tls-upstream: yes
EOF

echo "Unbound configured with forward-addr=$DNS"

# Start Unbound in the background
unbound -c "$unbound_conf" -d &

# DNSMasq configuration logic
conf="/etc/dnsmasq.conf"

if [ ! -f "$conf" ]; then
  conf="/etc/dnsmasq.custom"
  rm -f "$conf"
  cp /etc/dnsmasq.default "$conf"

  # Configure dnsmasq to use Unbound
  echo "server=127.0.0.1#5353" >> "$conf"
  echo "no-resolv" >> "$conf"
fi

# Start DNSMasq in the foreground
exec dnsmasq "--conf-file=$conf" --no-daemon

