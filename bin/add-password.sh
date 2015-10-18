#!/bin/bash

FILE=${1-"data"};
BACKUP_DIR=${2-"backups"};
PASSWORDS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

OLD_DATA="`openssl des3 -d -in $FILE &> /dev/null`" || {
	echo "Could not read \"$FILE\"."
	exit 1;
}

if [ "$OLD_DATA" != "" ]
then
	OLD_DATA="$OLD_DATA"$'\n'$'\n'
fi

echo -n "Service Name: "
read SERVICE
echo -n "Username: "
read USERNAME
echo -n "Password: "
read -s PASSWORD
echo



NEW_DATA="$OLD_DATA$SERVICE
Username: $USERNAME
Password: $PASSWORD"

# Write to $FILE (backup first)
$PASSWORDS_DIR/backup.sh $FILE $BACKUP_DIR
openssl des3 -in <(echo "$NEW_DATA") -out $FILE;
