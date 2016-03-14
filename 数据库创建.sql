#创建数据库
CREATE DATABASE user DEFAULT CHARACTER SET utf8;

#创建用户账户表
CREATE TABLE account(
uid  INT UNSIGNED not null  AUTO_INCREMENT,
username varchar(16) not null,
pw  VARCHAR(16) not null,
ppw  varchar(6) default '000000',
status enum('ok','banned') default 'ok',
primary key(uid),
key(username)
)AUTO_INCREMENT=10001 default charset=utf8;

#创建用户信息表
CREATE TABLE user_info(
uid  int UNSIGNED not null,
name varchar(30) not null,
head varchar(32),
sex  enum('未知','男','女') not null default '未知',
qq  varchar(10),
email  VARCHAR(26),
phone VARCHAR(11),
place varchar(13),
school varchar(30),
about varchar(30),
interest varchar(20),
blog varchar(50),
birthdate varchar(50),
primary key(uid)
)default charset=utf8;

#用户收藏表
CREATE TABLE user_favorite(
uid  int UNSIGNED not null,
favorite_mid bigint not null,
primary key(uid,favorite_mid)
)default charset=utf8;

#用户评论表
CREATE TABLE user_comment(
uid  int UNSIGNED not null,
cid  bigint not null,
primary key(uid,cid)
)default charset=utf8;


#创建消息数据库
CREATE DATABASE message DEFAULT CHARACTER SET utf8;

#创建消息表
CREATE TABLE msg_info(
mid  bigint not null AUTO_INCREMENT,
uid  int UNSIGNED not null,
mcontent varchar(140) not null,
mtype  tinyint not null default 0,
mstate  tinyint not null default 0,
mtime datetime not null,
mattach varchar(296),
primary key(mid)
)AUTO_INCREMENT=1000000 default charset=utf8;


#创建消息评论表
CREATE TABLE msg_comment(
mid  bigint not null,
cid bigint not null,
primary key(mid,cid)
)default charset=utf8;


#创建消息计数表
CREATE TABLE msg_count(
mid  bigint not null,
count_view int unsigned not null default 0,
count_like int unsigned not null default 0,
count_comment mediumint unsigned not null default 0,
count_repost int unsigned not null default 0,
primary key(mid)
)default charset=utf8;



#创建评论表
CREATE TABLE comment(
cid bigint not null AUTO_INCREMENT,
uid int unsigned not null,
content varchar(140) not null,
comment_time datetime not null,
primary key(cid)
)AUTO_INCREMENT=1000000 default charset=utf8;

#创建点赞列表
CREATE TABLE likelist(
uid int unsigned not null,
mid bigint not null,
primary key(uid,mid)
)default charset=utf8;

#创建收藏列表
CREATE TABLE favoritelist(
uid int unsigned not null,
mid bigint not null,
primary key(uid,mid)
)default charset=utf8;
