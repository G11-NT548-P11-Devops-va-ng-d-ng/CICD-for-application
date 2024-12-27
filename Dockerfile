# Base image
FROM node:20-alpine3.19

# Set working directory to the webphim folder
WORKDIR /webphim

# Copy dependency files
COPY webphim/package.json webphim/package-lock.json ./
# Install dependencies
COPY package.json package-lock.json ./
RUN npm ci

# Copy source files and build the app
COPY . .
RUN npm run build

# Production image with Nginx
FROM nginx:alpine

# Copy the built app to Nginx's default web root
COPY --from=build /app/build /usr/share/nginx/html

# Expose Nginx's HTTP port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

