# Use an official Node.js runtime as a parent image
FROM node:20-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Build the app (if using Vite or similar build tool)
RUN npm run build

# Expose the port Vite or your server runs on (changed to 5174)
EXPOSE 5174

# Start the app on port 5174
CMD ["npm", "run", "preview", "--", "--port", "5174"]
