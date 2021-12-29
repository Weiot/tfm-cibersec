1. Discover your ethernet interface
```bash
nmcli device status | grep ethernet | awk '{ print $1}'
```
2. Build docker Dockerfile-custom-agent image
```bash
docker build -f Dockerfile-custom-agent -t custom/siem:1.0 .
```
2. Replace in envvar docker-compose and add awslogs driver setup
```bash
docker run -e SURICATA_INTERFACE=<ETHERNET_INTERFACE> -e --log-driver=awslogs --log-opt awslogs-region=eu-west-1 --log-opt awslogs-group=siem1 --log-opt awslogs-create-group="true" custom/siem:1.0
```