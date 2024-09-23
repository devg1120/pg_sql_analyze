import pkg from 'node-sql-parser';
const { Parser } = pkg;

import * as util from "node:util";
import * as fs from "node:fs/promises";

function print_json(stmts) {
    process.stdout.write(JSON.stringify(stmts, null, 2));
    console.log("");
}

function parse( file ) {
    let ast = null;
    const parser = new Parser();
    try {
       ast = parser.astify(file); // mysql sql grammer parsed by default
    } catch (e) {
      console.log("msg:",e.message);
      //console.log(e.expected);
      console.log("found:",e.found);
      console.log("loc:",e.location);
    }
    //console.log(ast);
    return ast;
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
    //ast = parse('SELECT * FROM t');
    let ast = parse(file);
    print_json(ast);
    //console.log(ast);

  })
  .catch((err) => {
    console.error(err.message);
    process.exit(1);
  });

