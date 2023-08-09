---
## Tasks for SQL homework
---

# Homework 1:
* Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными (можно взять за образец таблицу из презентации)

* Выведите название, производителя и цену для товаров, количество которых превышает 2

* Выведите весь ассортимент товаров марки “Samsung”

# Homework 2:
* Создать БД vk, исполнив скрипт _vk_db_creation.sql (в материалах к уроку)

* Написать скрипт, добавляющий в созданную БД vk 2-3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей) (CREATE TABLE)

* Заполнить 2 таблицы БД vk данными (по 10 записей в каждой таблице) (INSERT)

# Homework 3:
* Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке. [ORDER BY]

* Выведите количество мужчин старше 35 лет [COUNT].

* Сколько заявок в друзья в каждом статусе? (таблица friend_requests) [GROUP BY]

# Homework 4:
* Подсчитать количество групп (сообществ), в которые вступил каждый пользователь.

* Подсчитать количество пользователей в каждом сообществе.

* Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).

# Homework 5:
* Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]

* Выведите данные, используя написанное представление [SELECT]

* Удалите представление [DROP VIEW]

* Сколько новостей (записей в таблице media) у каждого пользователя? Вывести поля: news_count (количество новостей), user_id (номер пользователя), user_email (email пользователя). Попробовать решить с помощью CTE или с помощью обычного JOIN.

# Homework 6:
* Написать функцию, которая удаляет всю информацию об указанном пользователе из БД vk. Пользователь задается по id. Удалить нужно все сообщения, лайки, медиа записи, профиль и запись из таблицы users. Функция должна возвращать номер пользователя.

* Предыдущую задачу решить с помощью процедуры и обернуть используемые команды в транзакцию внутри процедуры.
