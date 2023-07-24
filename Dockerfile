# NodeJs Builder
FROM node:18.14.0 as builder

WORKDIR /usr/src/app

COPY app/package.json .

RUN npm install

EXPOSE 3000


### NGINX
FROM nginx:1.23-alpine AS webserver

# ADD nginx.conf /etc/nginx/nginx.conf

ADD default.conf /etc/nginx/conf.d/default.conf
ADD default.conf /etc/nginx/sites-enabled/default
ADD default.conf /etc/nginx/sites-available/default

# expose port 80
EXPOSE 80

# run nginx
CMD ["nginx", "-g", "daemon off;"]


# Development NodeJs Runner
FROM builder as runner

ENV NODE_ENV development

CMD ["node", "server.js"]
