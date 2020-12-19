FROM node:15.4.0-alpine3.10

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json ./
RUN npm install

COPY . .
EXPOSE 2000
CMD ["npm", "start"]
