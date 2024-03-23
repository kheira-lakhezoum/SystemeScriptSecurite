#! /bin/bash

source "/home/hugo/secret.cfg"

url="https://api.football-data.org/v4/competitions/FL1/matches"

start_of_week=$(date -d "last Monday" "+%Y-%m-%d")
end_of_week=$(date -d "next Sunday" "+%Y-%m-%d")

response=$(curl -s "${url}?dateFrom=${start_of_week}&dateTo=${end_of_week}" \
           -H "X-Auth-Token: ${API_KEY}")

if [[ ${response} =~ "<html>" ]]; then
    echo "Erreur de récupération des données, veuillez vérifier votre connection internet ou votre clé API."
    exit 1
fi

match_list=$(echo "${response}" | jq -r '.matches[] | .homeTeam.name, .awayTeam.name, .utcDate')

echo "Liste des matchs de la Ligue 1 de la semaine du ${start_of_week} au ${end_of_week}:"
echo "------------------------------------------------------------------------------"
for entry in $(echo "${match_list}"); do
    echo "${entry}"
done
