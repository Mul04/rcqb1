FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update; apt upgrade -y
RUN apt install curl wget golang zip unzip nginx -y
COPY scriptplusconf /scriptplusconf
COPY qBconf.tar.gz /qBconf.tar.gz
RUN tar xvf /qBconf.tar.gz
RUN mkdir --parents /qBittorrent/downloads/
CMD curl "https://raw.githubusercontent.com/developeranaz/qbittorrent-to-rclone-heroku/main/scriptplusconf/about.html" > /var/www/html/about.html
CMD curl "https://raw.githubusercontent.com/developeranaz/qbittorrent-to-rclone-heroku/main/scriptplusconf/index.html" >/var/www/html/index.html
RUN chmod +x /scriptplusconf/entrypoint2.sh
RUN chmod +x /scriptplusconf/entrypoint1.sh
