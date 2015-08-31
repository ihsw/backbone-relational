FROM node

# environment setup
RUN apt-get update && apt-get install -y redis-server
RUN npm install -g bower gulp
COPY ./app /srv/app
WORKDIR /srv/app
RUN npm install && bower install --allow-root

# running it out
CMD ["npm start"]
