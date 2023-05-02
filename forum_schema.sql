DROP DATABASE IF EXISTS forum;
CREATE DATABASE forum;
USE forum;

CREATE TABLE IF NOT EXISTS user (

  user_id INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(20),
  lname VARCHAR(20),
  birthdate DATE,
  email VARCHAR(320),
  username VARCHAR(45),
  password VARCHAR(25)
  
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS post (

  post_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(100),
  content TEXT,
  username varchar(45),
  user_id INT,
  
  CONSTRAINT fk_post_user
  FOREIGN KEY (user_id) REFERENCES user (user_id),
  FOREIGN KEY (username) REFERENCES user (username)
  
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS reply (

  reply_id INT PRIMARY KEY AUTO_INCREMENT,
  content TEXT,
  post_id INT,
  replying_user INT,
  post_user INT,
  
  CONSTRAINT fk_reply_post
  FOREIGN KEY (post_id) REFERENCES post (post_id),
  
  CONSTRAINT fk_reply_user
  FOREIGN KEY (replying_user) REFERENCES user (user_id),
  FOREIGN KEY (post_user) REFERENCES user (user_id)

  
) ENGINE = InnoDB;