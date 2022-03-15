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
# COPY package-lock.json ./
RUN npm install
RUN npm install react-scripts@3.4.1 -g


# add app
COPY . ./

# start app
# CMD ["npm", "start"]
CMD ["/bin/bash"]
 
# At this point, cd app and npm start
# I have no idea why CMD ["npm", "start"] isn't working.
# ToDO: Figure that out...

# Spin up the container with
# docker run -it --rm -v %cd%:/app -v /app/node_modules -p 3001:3000 -e CHOKIDAR_USEPOLLING=true sample:dev

# https://mherman.org/blog/dockerizing-a-react-app/