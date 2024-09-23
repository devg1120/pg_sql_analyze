
CREATE TABLE address (
    address_id integer primary key NOT NULL, 
    address  varchar(50) NOT NULL,
    address2  varchar(50),
    district  varchar(20) NOT NULL,
    city_id smallint NOT NULL,
    postal_code  varchar(10),
    phone varchar(20) NOT NULL,
    last_update timestamp 
);


CREATE TABLE store (
    store_id integer  primary key NOT NULL, 
    manager_staff_id smallint NOT NULL,
    address_id smallint NOT NULL,
    last_update timestamp 
    --FOREIGN KEY (address_id) REFERENCES address (address_id)
);

CREATE TABLE customer (
    customer_id integer primary key, 
    store_id integer NOT NULL,
    first_name  varchar(45) NOT NULL,
    last_name  varchar(45) NOT NULL,
    email  varchar(50),
    address_id integer NOT NULL,
    activebool boolean DEFAULT true NOT NULL,
    last_update timestamp ,
    active integer
    --FOREIGN KEY (store_id) REFERENCES store (store_id),
    --FOREIGN KEY (address_id) REFERENCES address (address_id)
);

ALTER TABLE customer ADD FOREIGN KEY (store_id) REFERENCES store (store_id);
ALTER TABLE customer ADD FOREIGN KEY (address_id) REFERENCES address (address_id);
ALTER TABLE store    ADD FOREIGN KEY (address_id) REFERENCES address (address_id);


