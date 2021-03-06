#docker build . -t materialui
#docker run -d -p 8080:80  materialui
#
FROM node:12-alpine3.9 as builder

WORKDIR '/app/html'


COPY ./template1/ ./template1/
COPY ./template2/ ./template2/
COPY ./template3/ ./template3/

### Temp 1
WORKDIR '/app/html/template1'
RUN npm i .
RUN npm run-script build


### Temp 2
WORKDIR '/app/html/template2'
RUN npm i .
RUN npm run-script build



### Temp 3
WORKDIR '/app/html/template3'
RUN npm i .
RUN npm run-script build


#### NGINX
FROM ajcm/alpine-nginx:latest
WORKDIR '/app/html'

COPY --from=builder /app/html/template1/build /app/html/template1
COPY --from=builder /app/html/template2/build /app/html/template2
COPY --from=builder /app/html/template3/build /app/html/template3


## copy conf
COPY ./default.conf /etc/nginx/conf.d/default.conf

COPY ./*.html ./








################
LABEL "com.example.vendor"="mail@armandomarques.com"
#LABEL version="1.0"
LABEL description="Image with some React/Material Ui examples \
compiles with node12 and runs nginx:80 "


EXPOSE 80

