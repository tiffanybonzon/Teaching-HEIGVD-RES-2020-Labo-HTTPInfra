FROM node:12.16.3

RUN apt update && apt install -y neovim

COPY src/ /opt/app

CMD ["node", "/opt/app/index.js"]
