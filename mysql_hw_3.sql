USE vk;

/*
Задание 1. Написать скрипт, возвращающий список имен (только firstname) 
пользователей без повторений в алфавитном порядке. [ORDER BY]
*/

-- Выборка данных

SELECT DISTINCT firstname
FROM users
ORDER BY firstname;

/*
Задание 2. Выведите количество мужчин старше 35 лет [COUNT].
*/

-- Выборка данных

SELECT COUNT(*)
FROM profiles
WHERE (TIMESTAMPDIFF(YEAR, birthday, CURDATE()) > 35) AND (gender = 'М');

/*
Задание 3. Сколько заявок в друзья в каждом статусе? (таблица friend_requests) [GROUP BY]
*/

-- Заполнение таблицы данными

INSERT INTO friend_requests(initiator_user_id, target_user_id, `status`)
VALUES
(1, 2, 'requested'),
(4, 2, 'declined'),
(1, 3, 'approved'),
(2, 3, 'approved'),
(7, 2, 'unfriended'),
(9, 2, 'unfriended'),
(6, 2, 'unfriended');

-- Выборка данных

SELECT status, COUNT(*)
FROM friend_requests
GROUP BY status;
