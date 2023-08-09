USE vk;

/*
Задание 1. Написать функцию, которая удаляет всю информацию об указанном пользователе из БД vk. 
Пользователь задается по id. Удалить нужно все сообщения, лайки, медиа записи, 
профиль и запись из таблицы users. Функция должна возвращать номер пользователя.
*/

SET GLOBAL log_bin_trust_function_creators = 1;
DROP FUNCTION IF EXISTS delete_user_info;

DELIMITER //
CREATE FUNCTION delete_user_info(user_id BIGINT) RETURNS BIGINT
BEGIN
    
    DELETE FROM messages
    WHERE to_user_id = user_id;
    
	DELETE FROM messages
    WHERE from_user_id = user_id;
	
    DELETE FROM likes
    WHERE user_id = user_id;
    
    DELETE FROM media
    WHERE user_id = user_id;
    
    DELETE FROM friend_requests
    WHERE target_user_id = user_id;
    
    DELETE FROM friend_requests
    WHERE initiator_user_id = user_id;
    
    DELETE FROM communities
    WHERE admin_user_id = user_id;
    
    DELETE FROM profiles
    WHERE user_id = user_id;
    
    DELETE FROM users
    WHERE id = user_id;
    
    RETURN user_id;
END//
DELIMITER ;

SELECT delete_user_info(1);

/*
Задание 2. Предыдущую задачу решить с помощью процедуры и 
обернуть используемые команды в транзакцию внутри процедуры.
*/
DROP PROCEDURE IF EXISTS delete_user;

DELIMITER //
CREATE PROCEDURE delete_user(IN user_id BIGINT(11))
BEGIN
	START TRANSACTION;
    
    DELETE FROM messages
    WHERE to_user_id = user_id;
    
	DELETE FROM messages
    WHERE from_user_id = user_id;
	
    DELETE FROM likes
    WHERE user_id = user_id;
    
    DELETE FROM media
    WHERE user_id = user_id;
    
    DELETE FROM friend_requests
    WHERE target_user_id = user_id;
    
    DELETE FROM friend_requests
    WHERE initiator_user_id = user_id;
    
    DELETE FROM communities
    WHERE admin_user_id = user_id;
    
    DELETE FROM profiles
    WHERE user_id = user_id;
    
    DELETE FROM users
    WHERE id = user_id;
    
    COMMIT;
    
    SELECT user_id;
    
END//
DELIMITER ;

CALL delete_user(2);
    