# Base image
FROM node:18-alpine3.20

# Set working directory to the webphim folder
WORKDIR /app

# Copy dependency files
COPY react-basic/package*.json ./
RUN npm ci --prefix react-basic
COPY react-basic .

EXPOSE 3009

CMD ["npm", "start"]
