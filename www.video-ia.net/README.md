# Projet Video-IA

Ce dépôt contient le code source et les configurations pour le projet Video-IA, un annuaire complet des outils d'intelligence artificielle dédiés au domaine de la vidéo.

## Architecture

L'application est construite avec une architecture microservices utilisant Docker et Docker Compose:

- **MariaDB**: Base de données pour stocker les informations sur les outils, catégories, etc.
- **Next.js**: Application frontend/backend avec React, Tailwind CSS et Shadcn UI
- **Nginx**: Serveur web qui gère le proxy inverse et les certificats SSL
- **Certbot**: Service pour l'obtention et le renouvellement automatique des certificats SSL

## Prérequis

- Docker et Docker Compose
- Un nom de domaine pointant vers votre serveur (pour les certificats SSL)

## Installation

1. Clonez ce dépôt:
   ```bash
   git clone https://github.com/username/video-ia.git
   cd video-ia
   ```

2. Configurez les variables d'environnement en modifiant le fichier `.env`:
   ```
   DB_ROOT_PASSWORD=votre_mot_de_passe_root_securisé
   DB_PASSWORD=votre_mot_de_passe_utilisateur_securisé
   DOMAIN=votre-domaine.com
   NEXTAUTH_SECRET=votre_clé_secrète_aléatoire
   JWT_SECRET=votre_clé_jwt_aléatoire
   ```

3. Construisez et démarrez les conteneurs:
   ```bash
   docker-compose up -d
   ```

4. Attendez que tous les services démarrent et que les certificats SSL soient générés.

## Utilisation

- Site web: https://votre-domaine.com
- Administration: https://votre-domaine.com/admin

## Structure des fichiers

- `/mariadb`: Configuration de la base de données
- `/nginx`: Configuration du serveur web
- `/certbot`: Scripts pour la gestion des certificats SSL
- `/nextjs`: Application Next.js avec React

## Développement

Pour le développement local, vous pouvez modifier le fichier `docker-compose.yml` pour monter les volumes sources:

```yaml
volumes:
  - ./nextjs:/app
```

## Maintenance

### Mise à jour des conteneurs

```bash
docker-compose pull
docker-compose up -d
```

### Sauvegarde de la base de données

```bash
docker exec video-ia-mariadb mysqldump -uroot -p${DB_ROOT_PASSWORD} video_ia_db > backup.sql
```

## Licence

Projet sous licence propriétaire - voir le fichier LICENSE pour plus de détails.

## Contact

Pour toute question ou suggestion, contactez-nous à team@video-ia.com. 