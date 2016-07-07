#!/bin/bash

animals=/home/carkasjak/Scripts/animals.txt
adjectives=/home/carkasjak/Scripts/adjectives.txt

getrandomline () 
	{
	numOfLines=$(cat "$1" | wc -l)
	sed -n $((1 + RANDOM % $numOfLines))p "$1"
	}

capitalize ()
	{
	sed -e 's/^./\U&/'
	}

part1=$(getrandomline $adjectives | capitalize)
part2=$(getrandomline $adjectives | capitalize)
part3=$(getrandomline $animals | capitalize)

echo "${part1}${part2}${part3}"
