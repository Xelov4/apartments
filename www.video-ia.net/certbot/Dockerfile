FROM certbot/certbot:latest

# Ajout de labels pour la maintenance
LABEL maintainer="team@video-ia.com"
LABEL version="1.0"
LABEL description="Certbot container for SSL certificate management"

# Installation des dépendances
RUN apk add --no-cache bash curl

# Création du répertoire pour les scripts
RUN mkdir -p /scripts

# Copie des scripts
COPY ./scripts/init-certificate.sh /scripts/
COPY ./scripts/renew-certificate.sh /scripts/

# Configuration des permissions
RUN chmod +x /scripts/*.sh

# Définition des volumes pour les certificats et la validation
VOLUME /etc/letsencrypt
VOLUME /var/www/certbot

# Point d'entrée par défaut
ENTRYPOINT ["/scripts/renew-certificate.sh"] 