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
	temp   varchar(100),
  favoriteVideo varchar(2000),
  favoriteTopical varchar(2000),
  topicalIds varchar(2000)
)default charset=utf8;
--插入admin用户
-- insert into user(id,username,password,email,signupTime,points)
--alter table user add favoriteVideo varchar(2000) ;
--alter table user add favoriteTopical varchar(2000)
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
--访问视频播放日志表
 CREATE TABLE vistlog(
    id int NOT NULL AUTO_INCREMENT primary key,
    username varchar(20),
    ip varchar(20),
    url varchar(100),
    time varchar(30)
 )default charset=utf8;
 --留言信息表
 CREATE TABLE contact(
 	 id int NOT NULL AUTO_INCREMENT primary key,
 	 title varchar(50),
 	 email varchar(50),
 	 content VARCHAR (500),
 	 isRead int,
 	 time varchar(30)
 ) DEFAULT  charset=utf8;
 --主题表
 create table Topical(
  	 id int NOT NULL AUTO_INCREMENT primary key,
  	 authorId int,
  	 author varchar(20),
  	 tags VARCHAR(20),
  	 vkey varchar(30),
  	 title varchar(200),
  	 content varchar(10000),
  	  time varchar(30),
  	  authority int,
  	  views int,
  	  type int,
  	  orderIndex int
 ) DEFAULT  charset=utf8;
 --alter table Topical add vkey varchar(30) ;
 --修改字段长度 alter table Topical modify column content varchar(10000) ;
 --主题回复表
 create table TopicalReplay(
 		id int NOT NULL AUTO_INCREMENT primary key,
 	  topicalId int,
 	  replayAuthorId int,
 	  author varchar(20),
 	  content varchar(500),
 	  authority int,
 	  time  varchar(30)
 ) DEFAULT  charset=utf8;
 --用户收支表
 create table UserBalance(
  		id int NOT NULL AUTO_INCREMENT primary key,
  		userId int,
  		type varchar(30),
			amount int,
			description varchar(100),
			time varchar(30)
 )DEFAULT  charset=utf8;
 --用户下载记录表  作为用户重复下载不扣除金币的依据
create table UserDownloadLog(
  		id int NOT NULL AUTO_INCREMENT primary key,
  		userId int,
 		  userName  varchar(20),
 		  localPath varchar(100),
 		  title varchar(100),
 		  url varchar(100),
 		  time varchar(30)
 )DEFAULT  charset=utf8;

 --邀请码表
create table icode(
  		id int NOT NULL AUTO_INCREMENT primary key,
  	 card  varchar(20),
  	 code  varchar(20),
  	 type varchar(20)
 )DEFAULT  charset=utf8;
 --select * into outfile '/tmp/user.txt' from user
