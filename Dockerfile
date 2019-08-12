FROM node:lts
COPY package.json /app/package.json
WORKDIR /app
RUN yarn install
EXPOSE 8080
CMD ["yarn", "docs:dev"]
