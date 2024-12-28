# Base image
FROM node:20-alpine3.19

# Set working directory
WORKDIR /webphim

# Copy dependency files
COPY webphim/package.json webphim/package-lock.json ./

# Install dependencies
RUN npm install

# Copy application files
COPY webphim/ .

# Expose the application port (adjust as needed)
EXPOSE 3009

# Command to start the application
CMD ["npm", "start"]
