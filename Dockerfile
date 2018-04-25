FROM node:alpine
EXPOSE 8080
COPY app/server.js /server.js
CMD node server.js
