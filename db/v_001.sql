CREATE TABLE Board ( 
    b_id INTEGER NOT NULL AUTO_INCREMENT,
    b_title VARCHAR(20) NOT NULL,
    b_content TEXT NOT NULL,
	b_time VARCHAR(20) NOT NULL,
	b_user VARCHAR(20) NOT NULL,

    PRIMARY KEY (b_id)
)DEFAULT CHARSET=utf8;

select * from User;

show databases;

CREATE TABLE User ( 
    user_id VARCHAR(50) NOT NULL,
    password VARCHAR(140) NOT NULL,
    name VARCHAR(5) NOT NULL,
	phone_num VARCHAR(16) NOT NULL,
	class_num VARCHAR(5) NOT NULL,
	admin_enum tinyint(5) NOT NULL,
	disabled tinyint(1) NOT NULL,
	accepted tinyint(1) NOT NULL,
	gender VARCHAR(4)	NOT NULL,

    PRIMARY KEY (user_id)
)DEFAULT CHARSET=utf8;



