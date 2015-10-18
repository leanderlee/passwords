#!/bin/bash

FILE=${1-"data"};
DIR=${2-"backups"};

DATE="`date "+%Y-%m-%dT%H:%M:%SZ"`"

mkdir -p "$DIR"
cp "$FILE" "$DIR/$FILE-$DATE"

echo "Backup \"$FILE\"."
