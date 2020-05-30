FROM node:12.16.3

RUN apt update && apt install -y neovim

LABEL traefik.http.routers.dynamic.rule=Host(`api.res.ch`)
LABEL traefik.http.services.dynamic.loadbalancer.server.port=3000

COPY src/ /opt/app

CMD ["node", "/opt/app/index.js"]
