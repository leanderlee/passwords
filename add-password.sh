FILE="data";
TMP_FILE="secret.tmp";

echo -n "Service Name: "
read SERVICE
echo -n "Username: "
read USERNAME
echo -n "Password: "
read -s PASSWORD
echo

./backup.sh

openssl des3 -d -in $FILE -out $TMP_FILE;
echo $SERVICE >> $TMP_FILE
echo "Username: $USERNAME" >> $TMP_FILE
echo "Password: $PASSWORD" >> $TMP_FILE
echo "" >> $TMP_FILE

openssl des3 -in $TMP_FILE -out $FILE;
rm $TMP_FILE;