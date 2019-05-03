#!/bin/bash

#Trou à variables
random=$((${RANDOM} % 1000 + 1))
count=0
usr=0

# Boucle
while [ "${random}" -ne "${usr}" ]; do
echo "Choisissez un Nombre"
read usr
# Comparaison
	if [ "${usr}" -eq "${usr}" ]
	then
# Plus
		if [ "${usr}" -gt "${random}" ]
		then
			echo -e "Eh non ! C'est moins !\n"
			count=$((${count} + 1))
# Moins
		elif [ ${usr} -lt "${random}" ]
		then
			echo -e "Eh non ! C'est plus !\n"
			count=$((${count} + 1))
# Success
		else
			count=$((${count} + 1))
			echo -e "\nBravo ! Vous avez réussi en ${count} coups !\nLe bon numéro était ${usr} !"
		fi
# Error
	else
		echo -e -n "Ce n'est pas un nombre ! Veuillez en rentrer un exact\n"
		usr=0
	fi
done
