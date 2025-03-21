#!/bin/bash

# Script de renouvellement automatique des certificats SSL

echo "Démarrage du service de renouvellement des certificats..."

# Boucle infinie pour le renouvellement périodique
while true; do
  # Tentative de renouvellement
  echo "Vérification des certificats à renouveler..."
  certbot renew --webroot -w /var/www/certbot --quiet
  
  # Vérification de la réussite
  if [ $? -eq 0 ]; then
    echo "Renouvellement des certificats effectué ou non nécessaire."
    
    # Notification de renouvellement (optionnel)
    # curl -X POST -H "Content-Type: application/json" -d '{"text":"Certificats SSL renouvelés avec succès"}' $WEBHOOK_URL
  else
    echo "Échec du renouvellement des certificats!"
    
    # Notification d'échec (optionnel)
    # curl -X POST -H "Content-Type: application/json" -d '{"text":"ERREUR: Échec du renouvellement des certificats SSL"}' $WEBHOOK_URL
  fi

  # Pause avant la prochaine vérification (12h)
  echo "Prochaine vérification dans 12 heures..."
  sleep 12h
done 