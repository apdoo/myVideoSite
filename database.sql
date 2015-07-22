create database 94lu;--创建数据库ݿ94lu
--网站用户表
CREATE TABLE user(
  id int NOT NULL AUTO_INCREMENT primary key,
	username varchar(20),
  password varchar(20),
	email varchar(30),
	signupTime varchar(30),
	points int,
	type int,
	loginIp varchar(20),
	loginTime  varchar(30),
	temp   varchar(100)
)default charset=utf8;

--视频信息表
CREATE TABLE video(
  id int NOT NULL AUTO_INCREMENT primary key,
	title varchar(100),
	vkey varchar(30),
  imgName varchar(30),
	videoName varchar(10),
	infotime varchar(30),
	updatetime varchar(30),
	rate int,
	views int,
	favourite int,
	viewAuthority int,
  tags varchar(30),
  authorId int,
  author varchar(30),
  description varchar(200)
)default charset=utf8;
alter table video add column description varchar(200)