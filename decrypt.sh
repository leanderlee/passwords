FILE="data";
TMPFILE="display.txt";

openssl des3 -d -in $FILE -out $TMPFILE
less $TMPFILE
rm $TMPFILE