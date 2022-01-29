# Training data

The file `training.psv` contains 2 fields: taxon code and file name,
delimited with ‘|’. Files exist at the URL
`https://treetracker-production-images.s3.eu-central-1.amazonaws.com/<filename>`

Download with: `gawk 'BEGIN{FS="|"}{t[$2]=$1;T[$1]++}END{for (i in T) system("mkdir " i); for (i in t) system ("curl -s https://treetracker-production-images.s3.eu-central-1.amazonaws.com/" i " > " t[i] "/" i)}' training.psv` or equivalent.

IDs by Cam Webb. More files and taxa will be added regularly.

