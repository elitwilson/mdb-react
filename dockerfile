FROM node:13.12.0-alpine

WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# Install bash for testing/experimenting purposes
RUN apk update && apk add bash

COPY package.json ./
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
# docker run -ti --rm -p 8080:8080 sample:dev