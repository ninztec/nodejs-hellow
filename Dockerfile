# Stage 1: Build the application
FROM node:12 AS build

WORKDIR /usr/src/app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

RUN npm install

# Copy the application code
COPY . .

# Build the application (if needed)
# RUN npm run build

# Stage 2: Create a smaller production image
FROM node:12-alpine

# Create a non-root user to run the application
RUN addgroup -g 1001 -S nodejs && \
    adduser -u 1001 -S nodejs -G nodejs

WORKDIR /usr/src/app

# Copy the app from the previous stage
COPY --from=build --chown=nodejs:nodejs /usr/src/app .

# Switch to the non-root user
USER nodejs

EXPOSE 8000

CMD [ "node", "server.js" ]
