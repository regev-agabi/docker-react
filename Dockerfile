FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

# default command of nginx container is starting the hosting server
FROM nginx 
# copy the compile code from the builder stage
COPY --from=builder /app/build /usr/share/nginx/html
