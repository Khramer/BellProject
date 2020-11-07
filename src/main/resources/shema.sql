CREATE TABLE IF NOT EXISTS Organization (
    id          INTEGER     NOT NULL COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
    version     INTEGER     NOT NULL COMMENT 'Служебное поле hibernate',
    name        VARCHAR(50) NOT NULL COMMENT 'Наименование',
    full_name   VARCHAR(50) NOT NULL COMMENT 'Полное наименование',
    inn         VARCHAR(20)     NOT NULL COMMENT 'Идентификационный налоговый номер',
    kpp         VARCHAR(20)     NOT NULL COMMENT 'Код причины постановки',
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

CREATE TABLE IF NOT EXISTS Document_type (
    code    INTEGER         NOT NULL    COMMENT 'Код документа' PRIMARY KEY,
    version INTEGER         NOT NULL    COMMENT 'Служебное поле hibernate',
    name    VARCHAR(127)    NOT NULL    COMMENT 'Наименование вида документа'
);

CREATE TABLE IF NOT EXISTS Document (
    id          INTEGER              COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
    version     INTEGER     NOT NULL COMMENT 'Служебное поле hibernate',
    number      VARCHAR(50) NOT NULL COMMENT 'Номер документа',
    date        DATE        NOT NULL COMMENT 'Дата выдачи документа',
    doc_code    INTEGER     NOT NULL COMMENT 'Код документа'
);

CREATE INDEX IX_Doc_code_Id ON Document (doc_code);
ALTER TABLE Document  ADD FOREIGN KEY (doc_code) REFERENCES Document_type (code) ;

CREATE TABLE IF NOT EXISTS Country(
    code    VARCHAR(50) NOT NULL COMMENT 'Код страны' PRIMARY KEY,
    name    VARCHAR(50) NOT NULL COMMENT 'Наименование страны',
    version INTEGER     NOT NULL COMMENT 'Служебное поле hibernate'
);

CREATE TABLE IF NOT EXISTS User(
    id                  INTEGER     NOT NULL COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
    version             INTEGER     NOT NULL COMMENT 'Служебное поле hibernate',
    first_name          VARCHAR(50) NOT NULL COMMENT 'Имя',
    last_name           VARCHAR(50) NOT NULL COMMENT 'Фамилия',
    middle_name         VARCHAR(50) NOT NULL COMMENT 'Отчество',
    phone               VARCHAR(20) NOT NULL COMMENT 'Телефон',
    position            VARCHAR(50) NOT NULL COMMENT 'Должность',
    address    			VARCHAR(255)NOT NULL COMMENT 'Почтовый адрес',
    doc_id              INTEGER     NOT NULL COMMENT 'Документ',
    citizenship_code    INTEGER     NOT NULL COMMENT 'Гражданство',
    office_id           INTEGER     NOT NULL COMMENT 'Id oфиса',
    is_identified       BOOLEAN     NOT NULL COMMENT 'Статус (идентифицирован)',
);

COMMENT ON TABLE User IS 'Работник';

CREATE INDEX IX_User_office_id ON User (office_id);
ALTER TABLE User ADD FOREIGN KEY (office_id) REFERENCES Office(id);

CREATE INDEX IX_Citizenship_code_Id ON User (citizenship_code);
ALTER TABLE User ADD FOREIGN KEY (citizenship_code) REFERENCES Country(code);

CREATE UNIQUE INDEX UX_User_document_id ON User (doc_id);
ALTER TABLE User ADD FOREIGN KEY (doc_id) REFERENCES Document(id);

