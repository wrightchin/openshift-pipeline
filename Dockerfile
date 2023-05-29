FROM wrightchin/node:latest

RUN mkdir -p /usr/src/app &&\
 chown -R node:node /usr/src/app 

WORKDIR /usr/src/app

RUN chgrp -R 0 /usr/src/app &&\
 chmod -R g+rwX /usr/src/app

COPY package*.json /usr/src/app

RUN npm install

COPY . .

RUN chown -R node:node /usr/src/app/node_modules &&\
    chmod 777 /usr/src/app/node_modules

USER node

EXPOSE 3000
CMD ["npm", "start"]