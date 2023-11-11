# Ref: https://medium.com/swlh/jenkins-pipeline-to-create-docker-image-and-push-to-docker-hub-721919512f2
FROM node:latest as build-stage
RUN mkdir -p /app
WORKDIR /app
COPY package*.json /app/
RUN npm install
COPY . /app/
CMD [ "npm", "run", "build" ]

FROM nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build-stage /app/dist /usr/share/nginx/html
RUN pwd
RUN ls -tlra
CMD ["nginx", "-g", "daemon off;"]