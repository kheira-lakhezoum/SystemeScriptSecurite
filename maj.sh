#!/bin/bash 

update_packages() {
	echo " Mise à jour des paquets en cours !"
	sudo apt update && sudo apt upgrade -y
}

echo " Recherche de mises à jour en cours ! "
sudo apt update > /dev/null 2>&1

if [ $? -eq 0 ]; then
	echo " des mises à jours sont disponibles ! " 
	read -p " Souhaitez vous mettre à jour ? (O/N) ? " choice 
	case "$choice" in 
		[oO])
			echo "Lancement des mises à jour"
			update_packages
			;;
		[nN])
			echo "Mise à jour annulé !"
			;;
		*)
			echo "Choix invalide, mise à jour annulé ! "
			;;
	esac
else
	echo "Pas de mises à jour disponible"
fi 
