CREATE TABLE Board ( 
    b_id INTEGER NOT NULL AUTO_INCREMENT,
    b_title VARCHAR(20) NOT NULL,
    b_content TEXT NOT NULL,
	b_time VARCHAR(20) NOT NULL,
	b_user VARCHAR(20) NOT NULL,

    PRIMARY KEY (b_id)
)DEFAULT CHARSET=utf8;

select * from board;
