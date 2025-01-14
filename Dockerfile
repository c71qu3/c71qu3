# Use official Node.js image
FROM node:latest as build-stage

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json ./
COPY yarn.lock ./
RUN yarn install

# Copy source code
COPY . .

# Build c71qu3
RUN yarn build

# Use Nginx for static content
FROM nginx:alpine

# Copy built assets
COPY --from=build-stage /app/build/ /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Run Nginx on start
CMD ["nginx", "-g", "daemon off;"]