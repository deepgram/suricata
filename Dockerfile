FROM ubuntu:18.04
LABEL maintainer="Adam J. Sypniewski <adam@deepgram.com>"

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        software-properties-common && \
	DEBIAN_FRONTEND=noninteractive apt-add-repository ppa:oisf/suricata-stable && \
    DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		suricata && \
	DEBIAN_FRONTEND=noninteractive apt-get purge -y --autoremove \
        software-properties-common && \
	DEBIAN_FRONTEND=noninteractive apt-get clean

RUN chmod 755 /var/log/suricata

VOLUME /var/log/suricata

RUN /usr/bin/suricata -V

ENTRYPOINT ["/usr/bin/suricata"]
