/*
Задание 1
Создайте таблицу с мобильными телефонами, используя графический интерфейс. 
Заполните БД данными (можно взять за образец таблицу из презентации)
*/

-- создание таблиц

use homework_1;
CREATE TABLE phones (
id_phone INT AUTO_INCREMENT PRIMARY KEY,
model_name_phone VARCHAR(30) NOT NULL,
manufacturer VARCHAR(20) NOT NULL,
quanity INT NOT NULL,
price DECIMAL NOT NULL
);

-- наполнение данными

INSERT phones(model_name_phone, manufacturer, quanity, price)
VALUES 
('IPhone X', 'Apple', 10, 76000),
('IPhone Pro Max', 'Apple', 1, 90000),
('Samsung J2', 'Samsung', 3, 12000),
('Infinix NOTE 10', 'Infinix', 20, 16000),
('Nokia 2.4', 'Nokia', 0, 9000);

/*
Задание 2
Выведите название, производителя и цену для товаров, количество которых превышает 2
*/

-- вывод значений исходя из условия задания

SELECT model_name_phone, manufacturer, price
FROM phones
WHERE quanity > 2;

/*
Задание 3
Выведите весь ассортимент товаров марки “Samsung”
*/

-- вывод значений исходя из условия задания

SELECT model_name_phone, quanity, price
FROM phones
WHERE manufacturer = 'Samsung';
