FROM node:10

RUN mkdir -p /home/node/app/node_modules && chown -R node:node

WORKDIR /home/node/app

COPY package*.json ./

RUN npm install
RUN npm i npm@latest -g

COPY . .

COPY --chown=node:node . .

USER node

EXPOSE 9000
CMD ["node", "app.js"]