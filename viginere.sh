#!/usr/bin/bash

a="ABCDEFGHIJKLMNOPQRSTUVWXYZ"

# encrypt/decrypt option
[[ "${*/-d/}" != "" ]] &&
echo "Usage: $0 [-d]" && exit 1
m=${1:+-}

# inputs
printf "Plaintext: ";read pt
printf "keyword: ";read kw
printf "\n"

# convert to upper
t=$(echo $pt | tr [:lower:] [:upper:])
autok=$(echo $kw | tr [:lower:] [:upper:])

#keyword length check
if [ ${#autok} -lt 7 ]
then
	echo "Keyword must be atleast 7 chars long"
else 
	s=$(( ${#p} - ${#autok} ))
	k=$(echo $autok${t:0:$s})
	printf "Keyword:"; echo $k

# encrypt/decrypt process
for ((i=0;i<${#t};i++)); do
p1=${a%%${t:$i:1}*}
p2=${a%%${k:$((i%${#k})):1}*}
d="${d}${a:$(((${#p1}${m:-+}${#p2})%${#a})):1}"
done
echo "$d"
fi
