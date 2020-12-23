FROM node:13.12.0 as build

WORKDIR /home/app

COPY . . 

RUN npm install 

RUN npm run build

FROM nginx:latest

EXPOSE 80

COPY --from=build /home/app/build /usr/share/nginx/html