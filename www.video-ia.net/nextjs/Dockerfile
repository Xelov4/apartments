FROM node:20-alpine

# Ajout de labels pour la maintenance
LABEL maintainer="team@video-ia.com"
LABEL version="1.0"
LABEL description="Next.js container for Video-IA application"

# Création du répertoire de travail
WORKDIR /app

# Copie des fichiers de dépendances
COPY package.json package-lock.json* ./

# Installation des dépendances avec NPM
RUN npm ci

# Copie du reste des fichiers
COPY . .

# Construction pour la production
RUN npm run build

# Exposition du port standard Next.js
EXPOSE 3000

# Commande de démarrage
CMD ["npm", "start"] 