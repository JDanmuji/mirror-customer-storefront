# Use official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN yarn install --frozen-lockfile

# Copy the rest of the application code to the working directory
COPY . .

# Create a production build
RUN yarn build

# Inform Docker that the container is listening on the specified port
EXPOSE 8000

# Define the command to run the application
CMD ["yarn", "start"]
