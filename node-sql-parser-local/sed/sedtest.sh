var1=AAA
var2=BBBB
sed -i -e "s/$var1/$var2/g" file.txt
sed -i -r "s/'(.+)'/'\1.js'/g" file.txt

