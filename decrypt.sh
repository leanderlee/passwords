FILE=${1-"data"};

HEADER="Passwords in \"$FILE\"
- - - - - - - - - -
"

DATA="`openssl des3 -d -in $FILE &> /dev/null`" || {
	echo "Could not read \"$FILE\"."
	exit 1;
}

if [ -z $DATA ]; then
	echo $'\n'"   No passwords in \"$FILE\""$'\n' | less
	exit 0;
fi

echo "$HEADER"$'\n'"$DATA"$'\n'$'\n'$'\n' | less
