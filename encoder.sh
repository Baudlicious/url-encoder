#!/usr/bin/env bash

text=$1
new_text=""
pattern="0-9a-zA-Z"

usage() {
echo -e "Encodes URLs"
}

for (( i=0; i<${#text}; i++ )); do
	letter="${text:$i:1}"
	if [[  $letter  =~ [^$pattern] ]]
	then
		new_text+="$(echo -ne ${text:$i:1} | hexdump -v -e '/1 "%02x"' | sed 's/\(..\)/%\1/g' )"
	else
		new_text+="${text:$i:1}"
	fi	
done

echo -ne "Original text: $text"
echo ""
echo -ne "Encoded Text: $new_text"
echo ""
