import pkg from 'node-sql-parser';
const { Parser } = pkg;


//import Parser from './node-sql-parser/src/parser.js'
//import Parser from './node-sql-parser/lib/parser.js'
//import Parser from './node-sql-parser/output/prod/parser.js'


const parser = new Parser();
const ast = parser.astify('SELECT * FROM t'); // mysql sql grammer parsed by default

console.log(ast);

