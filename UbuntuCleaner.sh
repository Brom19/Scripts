#!/bin/sh

# source : https://doc.ubuntu-fr.org/nettoyer_ubuntu

# Supprimer le cache des paquets périmés :
sudo apt-get autoclean

# Supprimer tout le cache :
sudo apt-get clean

# Supprimer les paquets installés comme dépendances et devenus inutiles :
sudo apt-get autoremove

# Supprimer les logiciels orphelins
sudo apt-get install deborphan
sudo apt-get purge $(deborphan)
#sudo apt-get remove --purge $(deborphan)
#sudo apt-get remove --purge `deborphan`

# Supprimer les résidus des logiciels supprimés :
[[ $(dpkg -l | grep ^rc) ]] && sudo dpkg -P $(dpkg -l | awk '/^rc/{print $2}') || echo "pas de paquets à purger"

# Vider la corbeille :
rm -r -f ~/.local/share/Trash/*/*

# Supprimer les miniatures des images :
find ~/.thumbnails -type f -atime +7 -delete

# Supprimer les fichiers « locaux » inutiles
sudo apt-get install localepurge
sudo localepurge

# Supprimer les fichiers d'installation des paquets téléchargés (et installés)
sudo rm /var/cache/apt/archives/*.deb

