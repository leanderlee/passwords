FILE="data";
TMPFILE="display.txt";

openssl des3 -d -in "$FILE" -out "$TMPFILE"
chmod 400 "$TMPFILE"
(sleep 0; rm -f "$TMPFILE") &
less "$TMPFILE"
rm -f "$TMPFILE"