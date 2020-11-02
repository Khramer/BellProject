CREATE TABLE IF NOT EXISTS organization (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL ,
    fullName VARCHAR(50) NOT NULL ,
    inn INTEGER NOT NULL ,
    kpp INTEGER NOT NULL ,
    adress VARCHAR(50) NOT NULL ,
    phone VARCHAR(20) NOT NULL,
    isActive BOOLEAN
);

CREATE TABLE IF NOT EXISTS office (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    orgid INTEGER NOT NULL ,
    name VARCHAR(50) NOT NULL ,
    address VARCHAR(50) NOT NULL ,
    phone VARCHAR(20),
    isActive BOOLEAN
);

CREATE TABLE IF NOT EXISTS user (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    officeId INTEGER NOT NULL ,
    firstName VARCHAR(50) NOT NULL ,
    lastName VARCHAR(50),
    middleName VARCHAR(50),
    phone VARCHAR(20),
    docName VARCHAR(50),
    docNumber VARCHAR(50),
    docDate DATE,
    position VARCHAR(50) NOT NULL ,
    docCode INTEGER,
    citizenshipName VARCHAR(50),
    citizenshipCode VARCHAR(50),
    isIdentified BOOLEAN
);

CREATE TABLE IF NOT EXISTS docs(
    name VARCHAR(50),
    code INTEGER
);

CREATE TABLE IF NOT EXISTS countries(
    name VARCHAR(50),
    code INTEGER
);
