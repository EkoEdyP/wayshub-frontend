FROM node:14

WORKDIR /app

COPY package*.json ./
RUN npm install
RUN npm install pm2@latest -g

COPY . .

EXPOSE 3000

CMD ["pm2-runtime", "start", "ecosystem.config.js"]

# Builder
FROM node:14-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Production
FROM node:14-alpine

WORKDIR /app

RUN npm install -g pm2

COPY --from=builder /app /app

RUN npm prune --omit=dev

EXPOSE 3000

CMD ["pm2-runtime", "start", "ecosystem.config.js"]
