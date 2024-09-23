import pkg from 'node-sql-parser';
const { Parser } = pkg;


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


