USE vk;

/* 
Задание 2. Написать скрипт, добавляющий в созданную БД vk 2-3 новые таблицы 
(с перечнем полей, указанием индексов и внешних ключей) (CREATE TABLE)
*/

DROP TABLE IF EXISTS calls;
CREATE TABLE calls (
	id SERIAL,
	user_calling_id BIGINT UNSIGNED NOT NULL,
    user_recieving_id BIGINT UNSIGNED NOT NULL,
    called_at DATETIME DEFAULT NOW(),
    call_ended_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
    duration TIME,
    call_status VARCHAR(20), -- "принят", "пропущен", "оборван", "отклонён"
    
    PRIMARY KEY (user_calling_id, user_recieving_id),
    FOREIGN KEY (user_calling_id) REFERENCES users(id),
    FOREIGN KEY (user_recieving_id) REFERENCES users(id)
    );

DROP TABLE IF EXISTS stickers_shop;
CREATE TABLE stickers_shop (
	sticker_pack_id SERIAL,
	buyer_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
    sticker_pack_name VARCHAR(20),
    byuing_date DATETIME DEFAULT NOW(),
    price DECIMAL,
    
    FOREIGN KEY (buyer_id) REFERENCES users(id)
    );

DROP TABLE IF EXISTS wall;
CREATE TABLE wall (
	post_id SERIAL,
    author_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
    post_description VARCHAR(255),
    post_media_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (post_media_id) REFERENCES media(id)
    );
    
/*
Задание 3. Заполнить 2 таблицы БД vk данными (по 10 записей в каждой таблице) (INSERT)
*/

INSERT INTO users(firstname, lastname, email, password_hash, phone)
VALUES
('Алла', 'Илькуна', 'alla.ilkuna@rambler.ru', '43uvuyib768G678g8yg87v87vg8gv6', 79081897530),
('Прохор', 'Дятлов', 'prohor1989@rambler.ru', '442436dgfdfgfgdfyty87v87vg8gv6', 79566622931),
('Леонтий', 'Ямковой', 'leontiy6666@rambler.ru', '4423423443t4erteuh45wh574h54er', 79566768721),
('Дмитрий', 'Чурсунов', 'dmitriy.chursunov@outlook.com', '3r9m087hvt398hmvtwer98hvt48ygg', 79598787678),
('Давид', 'Щитт', 'david39@outlook.com', '43uvuyib768G678g8yg87v87vg8gv6', 72465477678),
('Максим', 'Герций', 'maksim.gerciy@hotmail.com', 'gq65gvg5v6g34v638yg87v87vg8gv6', 79987675234),
('Артем', 'Молочинский', 'artem1978@gmail.com', 'sdsa432545234124refsdf3243sf32', 79800905354),
('Давид', 'Кокорев', 'david16101967@gmail.com', 'bebt34b65344348g8yg87v87vg8gv6', 79633546435),
('Раиса', 'Цаплина', 'raisa4660@ya.ru', '43uvuyib768G678g8yg87v87vg8gv6', 79787876565),
('Ольга', 'Порсева', 'olga.porseva@yandex.ru', 'ffffffsdfsd44ffffffffff4328gv6', 79676546452);

INSERT INTO profiles(user_id, gender, birthday, hometown)
VALUES
(1, 'Ж', '1980-12-4', 'Москва'),
(2, 'М', '1989-1-12', 'Питер'),
(3, 'М', '1976-5-2', 'Москва'),
(4, 'М', '2002-2-23', 'Хохотуй'),
(5, 'М', '1980-3-12', 'Ростов-на-Дону'),
(6, 'М', '1990-9-22', 'Иркутск'),
(7, 'М', '1978-8-21', 'Екатеринбург'),
(8, 'М', '1998-12-12', 'Грозный'),
(9, 'Ж', '1980-5-28', 'Керч'),
(10, 'Ж', '2009-6-18', 'Чебоксары');

/*
Задание 4. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных 
(поле is_active = false). При необходимости предварительно добавить такое поле в таблицу 
profiles со значением по умолчанию = false (или 0) (ALTER TABLE + UPDATE) (timestampdiff(birthday, now()))
*/

ALTER TABLE profiles 
ADD COLUMN is_active BOOLEAN NOT NULL DEFAULT false;
UPDATE profiles
SET is_active = true
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) >= 18


