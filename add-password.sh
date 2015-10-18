FILE=${1-"data"};
BACKUP_DIR=${2-"backups"};

echo -n "Service Name: "
read SERVICE
echo -n "Username: "
read USERNAME
echo -n "Password: "
read -s PASSWORD
echo


OLD_DATA="`openssl des3 -d -in $FILE`"

if [ "$OLD_DATA" != "" ]
then
	OLD_DATA="$OLD_DATA"$'\n'$'\n'
fi

NEW_DATA="$OLD_DATA$SERVICE
Username: $USERNAME
Password: $PASSWORD"

# Write to $FILE (backup first)
./backup.sh $FILE $BACKUP_DIR
openssl des3 -in <(echo "$NEW_DATA") -out $FILE;
