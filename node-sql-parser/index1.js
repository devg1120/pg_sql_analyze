import pkg from 'node-sql-parser';
const { Parser } = pkg;

import * as util from "node:util";
import * as fs from "node:fs/promises";


function parse( file ) {

    const parser = new Parser();
    const ast = parser.astify(file); // mysql sql grammer parsed by default
    
    console.log(ast);
}

const { positionals } = util.parseArgs({
  allowPositionals: true,
});

if (positionals.length != 1) {
  console.log("arg: filepath");
  process.exit(1);
}

const filePath = positionals[0];

fs.readFile(filePath, { encoding: "utf8" })
  .then((file) => {
    //console.log(file);
    parse(file);
    //parse('SELECT * FROM t');

  })
  .catch((err) => {
    console.error(err.message);
    process.exit(1);
  });

