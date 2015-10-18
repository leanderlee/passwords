
DATE="`date "+%Y-%m-%dT%H:%M:%SZ"`"
DIR="backups"
FILE="data"

cp data "$DIR/data-$DATE"

echo "Backup for data."
