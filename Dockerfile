# Stage 1 : Build Angular application
FROM node:18.12-alpine AS build

# Install Angular CLI
RUN npm install -g @angular/cli@16.2

# Set working directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --legacy-peer-deps

# Copy the rest of the application
COPY . .

# Optional: clean cache to reduce size
RUN npm cache clean --force

# Build the Angular app in production mode
RUN ng build --configuration=production

# Stage 2 : Serve app with nginx
FROM nginx:alpine

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy build output to NGINX HTML directory
COPY --from=build /usr/src/app/dist/angularschool/browser /usr/share/nginx/html

# Expose port
EXPOSE 80

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]
