#!/bin/bash

# Trou à variables
outpath="/home/${USER}/Musique/"
url=$1

if [ ! -d ${outpath} ]
then
	mkdir ${outpath}
	echo -e "\nDossier Musique créé :\n${outpath}\n"
			#tentative verif url mais deja faite par youtube-dl
			#elif [ {url:0:24} -eq "https//youtube.com/" ]
			#then
			#	echo "Vous n'avez pas tapé un URL valide de Youtube"
fi

# Trou à cmd
titre=$(youtube-dl --skip-download --get-title --no-warning ${url} | sed 2d)
filename=$(ls /home/${USER}/Musique/ | grep "${titre}")

if [[ ! -f ${outpath}${filename} ]]
then
	echo -e "\nVotre musique va etre téléchargée dans l'Arborescence suivante:\n${outpath}\n"
	youtube-dl -x --audio-format best --output "${outpath}%(title)s.%(ext)s" ${url}
	echo -e "\nVotre musique est maintenant à vous petit troglodyte:\n${titre}\n"
elif [[ -f ${outpath}${filename} ]]
then
	echo -e "\nVous possédez déja cette Musique\n"
fi

