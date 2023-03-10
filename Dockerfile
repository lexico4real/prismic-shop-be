FROM node:16-alpine As development
RUN addgroup developer && adduser -S -G developer developer
USER developer
WORKDIR /api
RUN mkdir data
COPY package*.json .
RUN npm install
COPY . .
ENV PORT=${PORT} \
    NODE_ENV=development \
    DATABASE_HOST=${DATABASE_HOST} \
    DATABASE_NAME=${DATABASE_NAME} \
    DATABASE_PASSWORD=${DATABASE_PASSWORD} \
    DATABASE_PORT=${DATABASE_PORT} \
    DATABASE_USERNAME=${DATABASE_USERNAME} \
    DATABASE_TYPE=${DATABASE_TYPE} \
    REDIS_HOST=${REDIS_HOST} \
    REDIS_PORT=${REDIS_PORT} \
    REDIS_PASSWORD=${REDIS_PASSWORD} \
    JWT_SECRET=${JWT_SECRET} \
    JWT_EXPIRES_IN=${JWT_EXPIRES_IN} \
    EMAIL_SERVER=${EMAIL_SERVER} \
    EMAIL_ADDRESS=${EMAIL_ADDRESS} \
    EMAIL_PASSWORD=${EMAIL_PASSWORD} 
EXPOSE 3000
CMD ["npm", "run start:dev"]