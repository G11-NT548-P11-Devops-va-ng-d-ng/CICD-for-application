# Base image
FROM node:18-alpine3.20

# Set working directory to the webphim folder
WORKDIR react-basic/

# Copy dependency files
COPY package.json package-lock.json ./
RUN npm ci
#RUN npm install react-app-rewired
#RUN npm install customize-cra@0.1.1
#RUN npm install react-scripts
# Copy source files and build the app
COPY react-basic/ ./
RUN ls -la
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
