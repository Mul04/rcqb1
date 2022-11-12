FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update; apt upgrade -y
ENV PORT=8880
RUN apt install curl wget golang zip unzip nginx -y
COPY scriptplusconf /scriptplusconf
COPY qBconf.tar.gz /qBconf.tar.gz
RUN tar xvf /qBconf.tar.gz
mkdir --parents /qBittorrent/downloads/
curl "https://raw.githubusercontent.com/developeranaz/qbittorrent-to-rclone-heroku/main/scriptplusconf/about.html" > /var/www/html/about.html
curl "https://raw.githubusercontent.com/developeranaz/qbittorrent-to-rclone-heroku/main/scriptplusconf/index.html" >/var/www/html/index.html
RUN chmod +x /scriptplusconf/entrypoint2.sh
RUN chmod +x /scriptplusconf/entrypoint1.sh
