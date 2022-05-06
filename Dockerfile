# syntax=docker/dockerfile:1
FROM node:12-alpine
USER root
RUN apt-get update
RUN curl -sSL https://get.docker.com/ | sh
RUN apk add --no-cache python2 g++ make
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 3000
