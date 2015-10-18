FILE="data";
TMP_FILE1="secret1.tmp";
TMP_FILE2="secret2.tmp";

echo "Which Service Name To Remove?"
echo -n "> "
read SERVICE

./backup.sh

openssl des3 -d -in $FILE -out $TMP_FILE1
sed "/$SERVICE$/ { N; N; N; d; }" $TMP_FILE1 > $TMP_FILE2 || {
	rm $TMP_FILE1;
	rm $TMP_FILE2;
	echo 'Search failed.';
	exit 1;
}

if cmp $TMP_FILE1 $TMP_FILE2 >/dev/null 2>&1
then
	rm $TMP_FILE1;
	rm $TMP_FILE2;
	echo "No service name matched.";
	exit 1;
fi

rm $FILE
openssl des3 -in $TMP_FILE2 -out $FILE
rm $TMP_FILE1
rm $TMP_FILE2