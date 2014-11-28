GRANT ALL PRIVILEGES
ON gardenplatform.*
TO 'sungjin'@'%'
IDENTIFIED BY 'rkems';

LOAD DATA LOCAL INFILE 'D:\ssm2.csv'
INTO TABLE users_gardenuser
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(username,password,real_name, phone, class_num, gender);

desc users_gardenuser;

ALTER TABLE users_gardenuser MODIFY is_activate tinyint(1) DEFAULT '1';
ALTER TABLE users_gardenuser MODIFY is_admin tinyint(1) DEFAULT '0';
ALTER TABLE users_gardenuser MODIFY is_staff tinyint(1) DEFAULT '0';
ALTER TABLE users_gardenuser MODIFY is_superuser tinyint(1) DEFAULT '0';
ALTER TABLE users_gardenuser MODIFY last_login tinyint(1) DEFAULT '2014-01-01 00:00:00';
ALTER TABLE users_gardenuser MODIFY email varchar(255) DEFAULT 'test@email.com';
ALTER TABLE users_gardenuser MODIFY profile_img varchar(100) DEFAULT '/media/profile/GardenUserDefault.png';

SET SQL_SAFE_UPDATES=0;

SELECT *FROM users_gardenuser;

SELECT *FROM users_gardenuser
WHERE last_login="0000-00-00 00:00:00";

SELECT *FROM users_gardenuser
WHERE username="pooingx2";


SELECT *FROM users_gardenuser
WHERE profile_img="profile/GardenUserDefault.png";

UPDATE users_gardenuser
SET profile_img='/media/profile/GardenUserDefault.png'
WHERE profile_img='profile/GardenUserDefault.png'; 