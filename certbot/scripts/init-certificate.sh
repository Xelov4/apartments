#!/bin/bash

# Script d'initialisation des certificats SSL pour le domaine Video-IA

# Vérification des variables d'environnement
if [ -z "$DOMAIN" ]; then
  echo "La variable d'environnement DOMAIN est requise."
  exit 1
fi

if [ -z "$EMAIL" ]; then
  echo "La variable d'environnement EMAIL est requise."
  exit 1
fi

# Définition des variables
ADDITIONAL_DOMAINS=${ADDITIONAL_DOMAINS:-}
STAGING=${STAGING:-0}
DOMAIN_ARGS="-d ${DOMAIN}"

# Ajout des domaines supplémentaires
if [ ! -z "$ADDITIONAL_DOMAINS" ]; then
  for addl_domain in $(echo $ADDITIONAL_DOMAINS | tr ',' ' '); do
    DOMAIN_ARGS="$DOMAIN_ARGS -d $addl_domain"
  done
fi

# Vérification de l'existence de certificats
if [ -d /etc/letsencrypt/live/$DOMAIN ]; then
  echo "Les certificats pour $DOMAIN existent déjà. Exécution du renouvellement..."
  certbot renew
  exit 0
fi

# Définition des options de staging
if [ "$STAGING" = "1" ]; then
  echo "Mode STAGING activé. Les certificats ne seront pas approuvés en production."
  STAGING_ARG="--staging"
else
  STAGING_ARG=""
fi

echo "Demande de certificat pour $DOMAIN $DOMAIN_ARGS"

# Création du répertoire webroot s'il n'existe pas
mkdir -p /var/www/html/.well-known/acme-challenge

# Demande de certificat
certbot certonly --webroot -w /var/www/html \
  $DOMAIN_ARGS \
  --email $EMAIL \
  --rsa-key-size 4096 \
  --agree-tos \
  --force-renewal \
  --non-interactive \
  $STAGING_ARG

# Vérification de la réussite
if [ $? -ne 0 ]; then
  echo "Échec de la demande de certificat!"
  exit 1
fi

echo "Certificats générés avec succès pour $DOMAIN"
echo "Prochaine étape : renouvellement automatique"
exec /scripts/renew-certificate.sh 