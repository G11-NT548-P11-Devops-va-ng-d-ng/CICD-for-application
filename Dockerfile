# Base image
FROM node:20-alpine3.19

# Set working directory to the webphim folder
WORKDIR /webphim

# Copy dependency files
COPY webphim/package.json webphim/package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the files
COPY webphim/ . 

# Build the application
RUN npm run start

# Expose the application port (adjust if your app uses a different port)
EXPOSE 3009

# Command to start the application
CMD ["npm", "start"]
