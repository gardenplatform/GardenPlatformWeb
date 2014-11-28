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
ALTER TABLE users_gardenuser MODIFY email varchar(255) DEFAULT 'test@email.com';
ALTER TABLE users_gardenuser MODIFY profile_img varchar(100) DEFAULT 'profile/GardenUserDefault.png';


SELECT *FROM users_gardenuser;

SELECT *FROM users_gardenuser
WHERE last_login=""