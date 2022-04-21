#! /bin/bash 
echo "welcome ______ all"
echo "This tool is for finding live subdomains of a particular domain"
echo "enter a domain name: "
read url

echo "<><><><><><><><><>"

#sublisting domains

#sublist3r -d $url -o subdomain.txt

echo "starting assetfinder"

assetfinder --subs-only $url > alive.txt
echo " ______________________"
echo " sub domains completed"
echo "######################"
echo "please wait, it will take minutes"
echo " -->"

cat alive.txt | httprobe > alive1.txt


rm -r alive.txt

while read oglive; do
	echo ${oglive#*//} >> live1.txt
done < alive1.txt
sort -u live1.txt > sorted_sub.txt

rm -r live1.txt
rm -r alive1.txt

cat sorted_sub.txt

echo "=============================="
echo " live domains of $url is stored in sorted_sub.txt"
echo " ============================="
echo " script execution is completed"
