# Base image
FROM node:20-alpine3.19 AS build

# Set working directory to the webphim folder
WORKDIR webphim/

# Copy dependency files
COPY webphim/package.json webphim/package-lock.json ./
# Install dependencies
COPY package.json package-lock.json ./
RUN npm ci

# Copy source files and build the app
COPY webphim/ ./
RUN pwd
RUN npm start


#RUN npm run build
# Production image with Nginx
#FROM nginx:1.27.3-alpine
# Copy the built app to Nginx's default web root
#COPY --from=build /webphim/build /usr/share/nginx/html
# Expose Nginx's HTTP port


EXPOSE 3009

# Start Nginx
#CMD ["nginx", "-g", "daemon off;"]


CMD ["npm", "start"]
