# Base image
FROM node:20-alpine3.19

# Set working directory to the webphim folder
WORKDIR /webphim

# Copy the package.json and package-lock.json for dependency installation
COPY webphim/package.json webphim/package-lock.json ./

# Install dependencies
RUN npm install

# Copy all other files and folders from webphim
COPY webphim/ .

# Expose the application port (adjust if your app uses a different port)
EXPOSE 4000

# Command to start the application
CMD ["npm", "start"]
