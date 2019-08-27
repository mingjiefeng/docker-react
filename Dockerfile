# Builder image
FROM node:alpine AS builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


# Nginx image
FROM nginx

WORKDIR '/usr/share/nginx/html'

COPY --from=builder /app/build .

