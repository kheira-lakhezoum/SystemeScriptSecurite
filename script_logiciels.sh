#! /bin/bash

bash "./maj.sh"

choice=0
choice2=0

while [[ "$choice" != "1" && "$choice" != "2" ]]; do

	read -n 1 -p "Souhaitez-vous installer Apache (1) ou Nginx (2) ?" choice

	if [[ "$choice" != "1" && "$choice" != "2" ]]; then
		echo "Option invalide, veuillez choisir 1 ou 2"
	fi
done

case "$choice" in
	[1])
		echo "Installation d'Apache2"
		sudo apt install -y apache2
		;;
	[2])
		echo "Installation de Nginx"
		sudo apt install -y nginx
		;;
esac

while [[ "$choice2" != "1" && "$choice2" != "2" ]]; do

	read -n 1 -p "Souhaitez-vous installer MySQL (1) ou Mariadb (2) ?" choice2

	if [[ "$choice2" != "1" && "$choice2" != "2" ]]; then
		echo "Option invalide, veuillez choisir 1 ou 2"
	fi
done

case "$choice2" in
	1)
		echo "Installation de MySQL"
		sudo apt install -y mysql-server
		sudo apt install -y phpmyadmin
		;;
	2)
		echo "Installation de Mariadb et de Phpmyadmin"
		sudo apt install -y mariadb-server
		sudo apt install -y phpmyadmin
		;;
esac

sudo apt install -y nodejs npm

sudo apt install -y git



