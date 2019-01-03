Dockerized Suricata

# Description

This is Suricata, a network-based intrusion detection system (NIDS), embedded
in a Docker container for ease of deployment.

We use Suricata's official PPA to install pre-built binaries. As an added
convenience, Ubuntu's package manager will also install the emerging rulesets.

# Usage

Replace `<INTERFACE>` with the host machine's network interface of interest.

```
docker run --net=host deepgram/suricata -i <INTERFACE>
```

Suricata's default log directory (`/var/logs/suricata`) is exposed as a Docker
volume, making it easy to share among other containers.

# Customization

To customize Suricata, you may mount a YAML configuration file to
`/etc/suricata/suricata.yaml`.
