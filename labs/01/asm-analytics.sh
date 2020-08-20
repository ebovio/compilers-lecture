echo Hi, this is the output of the analysis:
echo You have the following kind of instructions:

awk -F '\t+' '{if (match($3, /[a-z]+/, m)) print m[0] 
if ($3 ~ /repz retq/) "retq"}' $1 | awk NF | sort | uniq -c | awk '{print "Executed times: " $0 }'

echo You have the following functions:
awk '/<[a-zA-Z]+>/ {print $0}' $1 | tr "<>:" "   " | awk '{if ($2 !~ /[0-9]+/) print $2 " located at address: " $1}'