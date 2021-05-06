FROM node:14.16.1

WORKDIR /usr/src/app

COPY package.json /usr/src/app/package.json
COPY yarn.lock /usr/src/app/yarn.lock

RUN yarn install

EXPOSE ${PORT:-3005}

COPY . /usr/src/app

CMD [ "yarn", "start" ]
