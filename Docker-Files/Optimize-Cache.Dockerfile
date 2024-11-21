FROM node:16
WORKDIR /app

# Copy dependency files first to leverage caching
COPY package*.json ./
RUN npm install

# Copy the application source code
COPY . .

# Set the default command to start the application
CMD ["npm", "start"]
