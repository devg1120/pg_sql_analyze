import pkg from 'node-sql-parser';
const { Parser } = pkg;



const parser = new Parser();
const ast = parser.astify('SELECT * FROM t'); // mysql sql grammer parsed by default

console.log(ast);

