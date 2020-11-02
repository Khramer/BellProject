INSERT INTO organization
(name, fullName, inn, kpp, adress, phone, isActive)
VALUE
('Doofenshmirtz Evil', 'Doofenshmirtz Evil Inc.Corporated', 111111111111, 111111111, 'ул. Зловещая, 5, Денвил', '3(343) 123-42-99', true),
('Umbrella', 'Umbrella Corporation', 123456789123, 123456789, 'ул. Суздальская, 46, Москва', '8 (495) 150-03-05', true );

INSERT INTO office
(orgid, name, address)
VALUE
(1, 'Фабрика', 'ул. Зловещая, 5, Денвил'),
(2, 'Лаборатория', 'ул. Суздальская, 46, Москва');

INSERT INTO user
(officeId, firstName, position)
VALUE
(1, 'Сергей', 'Помощник'),
(2, 'James ', 'Глава корпорации');

INSERT INTO docs
(name, code)
VALUE
(Паспорт, 1);

INSERT INTO countries
(name, code)
VALUE
('Россия', 1),
('United Kingdom', 2);