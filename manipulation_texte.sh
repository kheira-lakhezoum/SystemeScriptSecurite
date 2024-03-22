#! /bin/bash

cat > script.py << EOF
import csv
data = [["Jean", "25 ans", "Paris"],
["Marie", "30 ans", "Lyon"],
["Pierre", "22 ans", "Marseille"],
["Sophie", "35 ans", "Toulouse"]]

with open("data.csv", "w") as f:
	writer = csv.writer(f)
	writer.writerows(data)
EOF

chmod u+x script.py

sudo python3 script.py
