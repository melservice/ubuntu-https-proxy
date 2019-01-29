FROM melservice/ubuntu-https-proxy:latest

LABEL version="1.0" \
	description="https-Proxy als Service auf Ubuntu-Basis" \
	maintainer="develop@melsaesser.de"

# Die bereitgestellten Skripte und Einstellungen kopieren
COPY rootfs /

# Die aktuellen Paketlisten laden, Updates holen und Initialisierung laufen lassen,
# danach wird wieder aufgeräumt
RUN /docker/init/create-ubuntu-https-proxy.sh

# Volumes, die nach außen gereicht werden sollen
#VOLUME ["/docker/input", "/docker/output"]

# Port, der nach aussen durchgereicht wird
EXPOSE 80/tcp, 443/tcp

# Dies ist das Start-Kommando
CMD ["bash", "/docker/init/runService.sh"]
