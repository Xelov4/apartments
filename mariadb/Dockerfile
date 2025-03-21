FROM mariadb:10.11

# Ajout de labels pour la maintenance
LABEL maintainer="team@video-ia.com"
LABEL version="1.0"
LABEL description="Database container for Video-IA application"

# Copie des fichiers de configuration
COPY ./conf/my.cnf /etc/mysql/conf.d/
COPY ./init/init.sql /docker-entrypoint-initdb.d/

# Configuration de l'encodage par défaut
ENV LANG=C.UTF-8

# Exposition du port standard MySQL/MariaDB
EXPOSE 3306

# Définition du volume de données
VOLUME /var/lib/mysql

# Commande de démarrage
CMD ["mysqld"] 