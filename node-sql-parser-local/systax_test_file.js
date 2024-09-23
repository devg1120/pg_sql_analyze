import pkg from 'node-sql-parser';
const { Parser } = pkg;
import * as util from "node:util";
import * as fs from "node:fs/promises";



let cmd = null; 
//cmd = 'SELECT * FROM t'; 
//cmd = 'SELECT * FROM t;'; 
//cmd = 'ALTER TABLE customer ADD FOREIGN KEY (store_id) REFERENCES store (store_id);';
cmd = `
`;
cmd = `
CREATE TABLE customer (
    customer_id integer primary key, 
    store_id integer NOT NULL,
    first_name  varchar(45) NOT NULL,
    last_name  varchar(45) NOT NULL,
    email  varchar(50),
    address_id integer NOT NULL,
    activebool boolean DEFAULT true NOT NULL,
    last_update timestamp ,
    active integer,
    FOREIGN KEY (store_id) REFERENCES store (store_id),
    FOREIGN KEY (address_id) REFERENCES address (address_id)
);
`;

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
      //console.log("msg:",e.message);
      console.log("expext",e.expected);
      console.log("found:",e.found);
      console.log("loc:",e.location);
    }
    //console.log(ast);
    return ast;
}

/*
const parser = new Parser();
//const ast = parser.astify('SELECT * FROM t');
let ast = null;
try {
  ast = parser.astify(cmd);
} catch(e) {
      console.log("msg:",e.message);
      //console.log(e.expected);
      console.log("found:",e.found);
      console.log("loc:",e.location);

}
console.log(ast);
//console.log("");
//process.stdout.write(JSON.stringify(ast, null, 2));
//console.log("");

*/

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

