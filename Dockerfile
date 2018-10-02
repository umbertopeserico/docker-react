## Build phase
FROM node:alpine AS build
WORKDIR /app

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

## Run phase
FROM ngnix AS run
COPY --from=build /app/build /usr/share/ngnix/html