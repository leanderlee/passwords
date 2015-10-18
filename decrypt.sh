FILE=${1-"data"};

HEADER="Passwords in \"$FILE\"
- - - - - - - - - -
"

DATA="`openssl des3 -d -in $FILE`" || {
	echo "Wrong password."
	exit 1;
}

echo "$HEADER"$'\n'"$DATA"$'\n'$'\n'$'\n' | less
