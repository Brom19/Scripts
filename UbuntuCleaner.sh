#!/bin/sh

# Supprimer le cache des paquets périmés :
sudo apt-get autoclean

# Supprimer tout le cache :
sudo apt-get clean

#Supprimer les paquets installés comme dépendances et devenus inutiles :
sudo apt-get autoremove
