# sudo docker run \
# --rm \
# --name=wireguard-wgrest \
# --cap-add=NET_ADMIN \
# -e PUID=1000 \
# -e PGID=1000 \
# -e TZ=Europe/London \
# -e SERVERPORT=51820 `#optional` \
# -e PEERS=admin `#optional` \
# -e PEERDNS=auto `#optional` \
# -e INTERNAL_SUBNET=10.13.13.0 `#optional` \
# -e ALLOWEDIPS=0.0.0.0/0 `#optional` \
# -e LOG_CONFS=true `#optional` \
# -p 51820:51820/udp \
# -v wireguard-config:/config \
# -v wireguard-etc-wireguard:/etc/wireguard \
# --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
# linuxserver/wireguard

FROM debian:bullseye


RUN apt-get update -y && apt-get install -y \
      wireguard \
      curl \
      iproute2 \
      iptables \
      net-tools \
      neovim

WORKDIR /usr/bin
RUN curl -L https://github.com/suquant/wgrest/releases/latest/download/wgrest-linux-amd64 -o wgrest \
  && chmod +x wgrest

WORKDIR /srv/wireguard

RUN curl -L https://github.com/suquant/wgrest-webapp/releases/latest/download/webapp.tar.gz -o webapp.tar.gz
RUN mkdir -p /var/lib/wgrest/
RUN chown `whoami` /var/lib/wgrest/
RUN tar -xzvf webapp.tar.gz -C /var/lib/wgrest/

EXPOSE 8383
EXPOSE 51820

COPY ./docker_entrypoint.sh /srv/wireguard/docker_entrypoint.sh

CMD [ "/srv/wireguard/docker_entrypoint.sh" ]
