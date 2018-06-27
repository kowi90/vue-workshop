FROM node:9-alpine
MAINTAINER Gergo Kovacs gergo.kovacs.90@gmail.com
RUN apk add --no-cache git curl
RUN apk add --no-cache bash
RUN npm i vue-cli -g
RUN mkdir /code
COPY . /code
WORKDIR /code