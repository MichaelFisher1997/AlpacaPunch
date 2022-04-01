DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS manufacturers;
DROP TABLE IF EXISTS products;

CREATE TABLE IF NOT EXISTS customers (
    custID int NOT NULL AUTO_INCREMENT,
    custFirstName VARCHAR(45) NOT NULL,
    custLastName VARCHAR(50) NOT NULL,
    custAddress VARCHAR (150),
    custPostcode VARCHAR (8),
    custTel VARCHAR(15) NOT NULL,
    custEmail VARCHAR(80) NOT NULL,

    cardNo int,
    cardType VARCHAR(20),
    cardExpiry VARCHAR(5),
    cardCustName VARCHAR(90),
    cardSecNo int,

    subStatus VARCHAR(5),
    subDate VARCHAR(10),
    
    CONSTRAINT customers_pk PRIMARY KEY(custID)
);

CREATE TABLE IF NOT EXISTS products (
    SKU int NOT NULL,
    prodName VARCHAR(35) NOT NULL,
    prodDescription VARCHAR(500),

    CONSTRAINT products_pk PRIMARY KEY(SKU)
);

CREATE TABLE IF NOT EXISTS manufacturers (
    manufID int NOT NULL AUTO_INCREMENT,
    manufName VARCHAR(35) NOT NULL,
    manufAddress VARCHAR(150),
    manufPostcode VARCHAR(8),
    manufEmail VARCHAR(80),
    manufTel VARCHAR(15),

    CONSTRAINT manufacturers_pk PRIMARY KEY(manufID)
);

CREATE TABLE IF NOT EXISTS orders (
    transacID int UNIQUE NOT NULL,
    orderAmount int,
    orderTotal int NOT NULL,
    orderDate DATE NOT NULL,
    importOrExport VARCHAR(1),
    dateRecieved DATE,
    manufID int NOT NULL,
    SKU int NOT NULL,

    CONSTRAINT orders_pk PRIMARY KEY(transacID),
    CONSTRAINT orders_prod_fk FOREIGN KEY(SKU) REFERENCES products(SKU)
    ON DELETE CASCADE,
    CONSTRAINT orders_manuf_fk FOREIGN KEY(manufID) REFERENCES manufacturers(manufID)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS inventory (
    invID int NOT NULL AUTO_INCREMENT,
    invType VARCHAR(15) NOT NULL,
    availableAmount int NOT NULL,
    SKU int NOT NULL,

    CONSTRAINT inv_pk PRIMARY KEY(invID),
    CONSTRAINT inv_prod_fk FOREIGN KEY(SKU) REFERENCES products(SKU)
    ON DELETE CASCADE
);