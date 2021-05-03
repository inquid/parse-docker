FROM node:lts-alpine
LABEL MAINTAINER contact@inquid.co

RUN mkdir -p /usr/src/parse
WORKDIR /usr/src/parse

RUN \
  # install
  apk add -U --no-cache \
    supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY package.json /usr/src/parse/
RUN npm install

COPY . /usr/src/parse

ENV APP_ID YourAppId
ENV MASTER_KEY YourMasterKey
ENV FILE_KEY YourOptionalFileKey

EXPOSE 8080 1337

CMD ["/usr/bin/supervisord"]
