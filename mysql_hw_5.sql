USE vk;

/*
Задание 1. Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]
*/
DROP VIEW IF EXISTS users_view;
CREATE VIEW users_view AS
SELECT id, firstname, lastname, email, phone, gender, birthday, created_at, hometown
FROM vk.users AS u
LEFT JOIN profiles as p
ON u.id = p.user_id;

/*
Задание 2. Выведите данные, используя написанное представление [SELECT]
*/

SELECT *
FROM users_view;

/*
Задание 3. Удалите представление [DROP VIEW]
*/

DROP VIEW IF EXISTS users_view;

/*
Задание 4.* Сколько новостей (записей в таблице media) у каждого пользователя? 
Вывести поля: news_count (количество новостей), user_id (номер пользователя), 
user_email (email пользователя). Попробовать решить с помощью CTE или с помощью обычного JOIN.
*/

-- Заполнение таблиц данными

INSERT INTO media_types(name)
VALUES
('pfp11.png'),
('pfp123.jpeg'),
('pfp323.jpg'),
('pfp22.jpeg'),
('pfp232.png'),
('pfp9.png'),
('pfp3.png'),
('me.png'),
('homyak.png'),
('cat.jpg');

INSERT INTO media(media_type_id, user_id, body, size)
VALUES
(1, 1, 'Пост 1', 5),
(2, 3, 'Пост 1', 5),
(3, 3, 'Пост 2', 5),
(4, 3, 'Пост 3', 5),
(5, 4, 'Пост 1', 5),
(6, 4, 'Пост 2', 5),
(7, 1, 'Пост 2', 5),
(8, 1, 'Пост 3', 5),
(9, 1, 'Пост 4', 5),
(10, 10, 'Пост 1', 5);

-- Выборка данных

SELECT COUNT('Число новостей'), users.id, users.email
FROM media
LEFT JOIN users
ON media.user_id = users.id
GROUP BY users.id;
