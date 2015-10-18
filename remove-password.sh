FILE=${1-"data"};
BACKUP_DIR=${2-"backups"};
PASSWORDS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Which Service Name To Remove?"
echo -n "> "
read SERVICE

OLD_DATA="`openssl des3 -d -in $FILE`"

NEW_DATA=$(sed "/^$SERVICE$/ { N; N; N; d; }" <<< "$OLD_DATA") || {
	echo 'Search failed.';
	exit 1;
}

DIFF=$(diff  <(echo "$OLD_DATA" ) <(echo "$NEW_DATA"))

if [ "$DIFF" == "" ]; then
	echo "No service name matched.";
	exit 1;
fi

# Write to $FILE (backup first)
$PASSWORDS_DIR/backup.sh $FILE $BACKUP_DIR
openssl des3 -in <(echo "$NEW_DATA") -out $FILE
