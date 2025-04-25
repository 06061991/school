# stage 1 : build Angular application
FROM node:18.12-alpine AS build

# ✅ Ajout des dépendances système
RUN apk add --no-cache python3 make g++

# Installation de l'Angular CLI
RUN npm install -g @angular/cli@16.2

# Définir le répertoire de travail
WORKDIR /usr/src/app

# Copier les fichiers de dépendances
COPY package*.json ./

# Installer les dépendances Node.js
RUN npm install --legacy-peer-deps

# Copier le reste du code
COPY . .

# Build de l'application Angular
RUN ng build

# stage 2 : run
FROM nginx:alpine

# Configuration NGINX personnalisée
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copier les fichiers build dans nginx
COPY --from=build /usr/src/app/dist/angularschool /usr/share/nginx/html

# Exposer le port
EXPOSE 80
