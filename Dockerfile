FROM node:lts-alpine
LABEL MAINTAINER contact@inquid.co

RUN mkdir -p /usr/src/parse
WORKDIR /usr/src/parse

RUN apt install -y supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY package.json /usr/src/parse/
RUN npm install

COPY . /usr/src/parse

ENV APP_ID YourAppId
ENV MASTER_KEY YourMasterKey
ENV FILE_KEY YourOptionalFileKey

EXPOSE 8080

CMD ["/usr/bin/supervisord"]
