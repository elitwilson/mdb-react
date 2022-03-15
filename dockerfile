# pull official base image
FROM node:13.12.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# Install bash
RUN apk update && apk add bash

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install
RUN npm install react-scripts@3.4.1 -g --silent
# RUN npm install -g webpack-dev-server -y
# RUN npm install -g webpack-cli -y
# RUN npm install -g webpack -y

# add app
COPY . ./

# start app
# CMD ["npm", "start"]
# CMD webpack-dev-server --watch --config webpack.config.js --hot

# Spin up the container with
# docker run --rm -it -v %cd%:/app sample:dev