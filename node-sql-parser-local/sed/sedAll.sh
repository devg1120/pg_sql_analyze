
###  from './src/parser'
###  to './src/parser.js'


for f in ./*.js ; do

  echo "file: $f"
  sed -i -r "s/'(.+)'/'\1.js'/g" $f

done

