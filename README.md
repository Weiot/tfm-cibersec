

1. Discover your ethernet interface
```bash
nmcli device status | grep ethernet | awk '{ print $1}'
```
1. Replace in envvar docker-compose
```bash
docker-compose run -e SURICATA_INTERFACE=enp3s0
```