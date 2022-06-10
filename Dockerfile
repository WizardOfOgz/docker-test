### Build
FROM node:16-alpine AS builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

CMD ["npm", "run", "start"]

### Run
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html/
