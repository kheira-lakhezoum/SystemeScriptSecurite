#! /bin/bash

#secret.cfg:
#API_KEY="XXXXXXXXXXXXXXXXXXXXXXXX"

source /home/hugo/secret.cfg

URL="https://api.football-data.org/v2/competitions/FL1/matches"

start_of_week=$(date -d "last sunday" +%Y-%m-%d)

response=$(curl -s -H "X-Auth-Token: $API_KEY" "$URL")

if [ $? -eq 0 ]; then
    matches=$(echo "$response" | jq -r --arg start "$start_of_week" '.matches | map(select(.utcDate | startswith($start)))')
    echo "Liste des matchs de la Ligue 1 de la semaine en cours (du $start_of_week) :"
    echo "---------------------------------------------------------------------------"
    echo "$matches" | jq -r '.[] | "\(.homeTeam.name) vs \(.awayTeam.name) - \(.utcDate)"'
else
    echo "Erreur lors de la récupération des données. Veuillez vérifier votre clé API ou votre connexion Internet."
fi

