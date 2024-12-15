FROM node:latest as base

WORKDIR /home/node/app

COPY package*.json ./

RUN npm i

COPY . .

COPY tsconfig.json ./tsconfig.json


FROM base as production

ENV NODE_PATH=./build

RUN npm run build