FROM node:14.16.1

WORKDIR /usr/src/app

COPY package.json /tmp/package.json
COPY yarn.lock /tmp/yarn.lock
RUN cd /tmp && npm install
RUN cp -a /tmp/node_modules ./

RUN yarn install

COPY . .

EXPOSE ${PORT:-3000}

CMD [ "yarn", "start" ]
