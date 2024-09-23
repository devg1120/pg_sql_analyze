
###  from './src/parser'
###  to './src/parser.js'



echo "file: $1"
sed -i -r "s/'(.+)'/'\1.js'/g" $1


