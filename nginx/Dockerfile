FROM nginx:1.25-alpine

# Ajout de labels pour la maintenance
LABEL maintainer="team@video-ia.com"
LABEL version="1.0"
LABEL description="Nginx container for Video-IA application"

# Suppression de la configuration par défaut
RUN rm /etc/nginx/conf.d/default.conf

# Copie des fichiers de configuration
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

# Création des répertoires nécessaires
RUN mkdir -p /var/cache/nginx /var/www/certbot

# Attribution des permissions
RUN chown -R nginx:nginx /var/cache/nginx

# Exposition des ports HTTP et HTTPS
EXPOSE 80 443

# Commande de démarrage
CMD ["nginx", "-g", "daemon off;"] 