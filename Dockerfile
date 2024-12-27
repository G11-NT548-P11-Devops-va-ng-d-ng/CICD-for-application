# Base image
FROM node:20-alpine3.19

# Set working directory to the webphim folder
WORKDIR /react-basic

# Copy the package.json and package-lock.json for dependency installation
COPY react-basic/package.json react-basic/package-lock.json ./

# Install dependencies
RUN npm install

# Copy all other files and folders from webphim
COPY react-basic/ .

# Expose the application port (adjust if your app uses a different port)
EXPOSE 4000

# Command to start the application
CMD ["npm", "start"]
