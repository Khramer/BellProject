CREATE TABLE IF NOT EXISTS Organization (
    id          INTEGER     NOT NULL COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
    version     INTEGER     NOT NULL COMMENT 'Служебное поле hibernate',
    name        VARCHAR(50) NOT NULL COMMENT 'Наименование',
    full_name   VARCHAR(50) NOT NULL COMMENT 'Полное наименование',
    inn         INTEGER     NOT NULL COMMENT 'Идентификационный налоговый номер',
    kpp         INTEGER     NOT NULL COMMENT 'Код причины постановки',
    address     VARCHAR(50) NOT NULL COMMENT 'Почтовый адрес',
    phone       VARCHAR(20) NOT NULL COMMENT 'Телефон',
    is_active   BOOLEAN     NOT NULL COMMENT 'Статус (действующий)'
);

COMMENT ON TABLE Organization IS 'Организация';

CREATE TABLE IF NOT EXISTS Office (
    id          INTEGER     NOT NULL COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
    version    	INTEGER 	NOT NULL COMMENT 'Служебное поле hibernate',
    name        VARCHAR(50) NOT NULL COMMENT 'Наименование',
    address     VARCHAR(50) NOT NULL COMMENT 'Почтовый адрес',
    phone       VARCHAR(20) NOT NULL COMMENT 'Телефон',
    is_active   BOOLEAN     NOT NULL COMMENT 'Статус (действующий)',
    org_id      INTEGER     NOT NULL COMMENT 'Id организации'
);

COMMENT ON TABLE Office IS 'Офис';

CREATE INDEX IX_Office_organization_id ON Office (org_id);
ALTER TABLE Office ADD FOREIGN KEY (org_id) REFERENCES Organization(id);

CREATE TABLE IF NOT EXISTS User (
    id                  INTEGER     NOT NULL COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
    version             INTEGER     NOT NULL COMMENT 'Служебное поле hibernate',
    first_name          VARCHAR(50) NOT NULL COMMENT 'Имя',
    last_name           VARCHAR(50) NOT NULL COMMENT 'Фамилия',
    middle_name         VARCHAR(50) NOT NULL COMMENT 'Отчество',
    phone               VARCHAR(20) NOT NULL COMMENT 'Телефон',
    position            VARCHAR(50) NOT NULL COMMENT 'Должность',
    address    			VARCHAR(255)NOT NULL COMMENT 'Почтовый адрес',
    doc_code            INTEGER     NOT NULL COMMENT 'Документ',
    citizenship_code    INTEGER     NOT NULL COMMENT 'Гражданство',
    office_id           INTEGER     NOT NULL COMMENT 'Id oфиса',
    is_identified       BOOLEAN     NOT NULL COMMENT 'Статус (идентифицирован)',
);

COMMENT ON TABLE User IS 'Работник';

CREATE INDEX IX_User_office_id ON User (office_id);
ALTER TABLE User ADD FOREIGN KEY (office_id) REFERENCES Office(id);

CREATE TABLE IF NOT EXISTS Docs(
    code    INTEGER     NOT NULL COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(50) NOT NULL COMMENT 'Наименование вида документа',
    number  VARCHAR(50) NOT NULL COMMENT 'Номер документа',
    date    DATE        NOT NULL COMMENT 'Дата выдачи документа',
    version INTEGER     NOT NULL COMMENT 'Служебное поле hibernate'
);

CREATE INDEX UX_Doc_code_Id ON User (doc_code);
ALTER TABLE User ADD FOREIGN KEY (doc_code) REFERENCES Docs(code) ;

CREATE TABLE IF NOT EXISTS Country(
    code    VARCHAR(50) NOT NULL COMMENT 'Код страны' PRIMARY KEY,
    name    VARCHAR(50) NOT NULL COMMENT 'Наименование страны',
    version INTEGER     NOT NULL COMMENT 'Служебное поле hibernate'
);

CREATE INDEX IX_Citizenship_code_Id ON User (citizenship_code);
ALTER TABLE User ADD FOREIGN KEY (citizenship_code) REFERENCES Country(code);