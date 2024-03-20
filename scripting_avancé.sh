#! /bin/bash

date=`date "+%Y-%m-%d"`
SOURCE="/home/hugo/Documents/Plateforme"
BACKUP="/home/hugo/Documents/backup"
HISTORIC="/home/hugo/Documents/backup/$date"

if [ ! -d "$SOURCE" ]; then
	echo "Erreur le fichier Plateforme n'existe pas"
	exit 1
fi

if [ ! -d "$BACKUP" ]; then
	mkdir "$BACKUP"
fi

if [ ! -d "$HISTORIC" ]; then
	mkdir "$HISTORIC"
fi

cp -R "$SOURCE"/* "$HISTORIC"

if [ $? -eq 0 ]; then
	echo "Sauvegarde effectuée avec succès."
else
	echo "Erreur lors de la sauvegarde."
fi
