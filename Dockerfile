FROM node:18.19.0-slim

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

CMD ["npm" , "test"]

