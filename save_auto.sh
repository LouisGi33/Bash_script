#!/bin/bash

# Trou à variables
to_backup=$1
backup=$2
now=$(date '+%A %k:%M')

# Verification droits
if [[ ${UID} -ne 0 ]]; then
	echo "Vous n'avez pas les droits, seul un grand et puissant root pourra vous aider"
	exit 1
fi

# Trou à fonctions
error(){
	if [ ! -d ${to_backup} ]; then
		echo -e "\nFichier inexistant.\n"
		exit 1
	fi
}

aide() {
    	echo -e "	
     ----- Menu d'Aide -----\n
./save_auto.sh [OPT1]
./save_auto.sh ./dossier/a/save ./dossier/backup/ [OPT3]\n
Options:
-d ou -disable		[OPT1]	Annuler la sauvegarde automatique
-h ou -help		[OPT1]	Menu d'Aide
-m ou -manuel		[OPT3]	Sauvegarde manuelle d'un dossier
-e ou -enable		[OPT3]	Sauvegarde automatisée\n"
}

save() {
	backfile="${backup}-BACKUP-`date "+%d.%m.%Y_%H:%M:%Ss"`.tar.gz"
	if [ ! -d ${backup} ]; then
		mkdir ${backup}
	fi
	tar -czpf ${backfile} ${to_backup}
}

# Script
if [[ ($1 == "-h") || ($1 == "-help") ]]; then
	aide
    	exit 1
elif [[ ($3 == "-m") || ($3 == "-manuel") ]]; then
	error
	if [ ! -d ${backup} ]; then
		echo -e -n "\nVoulez-vous créer le dossier de Sauvegarde? Y/n : "
		read up
		if [ $up = "Y" ] || [ $up = "y" ] || [ $up = "yes" ] || [ $up = "YES" ]; then		
			save
			echo -e "Sauvegarde effectuée !\n"
		else
			echo -e "Abandon\n"
			exit 1
		fi
	else
		save
		echo "Sauvegarde effectuée !"
	fi
elif [[ ($3 == "-e") || ($3 == "-enable") ]]; then
	error
	echo "Sauvegarde automatique en cours.. Ne fermez pas ce terminal"
	while :
	do
		if [[ $now == "vendredi 17:00" ]]; then
			save
		fi
	done
	
elif [[ ($1 == "-d") || ($1 == "-disable") ]]; then
	pkill save_auto.sh
	exit 1
else
    	echo -e "Commande Invalide\n"
	exit 1
fi
