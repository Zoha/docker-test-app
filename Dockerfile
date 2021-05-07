FROM node:14.16.1

COPY package.json /tmp/package.json
COPY yarn.lock /tmp/yarn.lock
RUN cd /tmp && npm install

WORKDIR /usr/src/app

RUN cp -a /tmp/node_modules ./

RUN yarn install

COPY . .

EXPOSE ${PORT:-3000}

CMD [ "yarn", "start" ]
