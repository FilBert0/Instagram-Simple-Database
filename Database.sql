create database `instagram` ; 
use instagram;
 
create table users (
	id integer auto_increment primary key,
    name varchar(50) not null,
     created_at TIMESTAMP DEFAULT NOW()
);

create table photos (
	id integer auto_increment primary key,
    img_url varchar(255) not null,
    user_id integer not null,
	created_at TIMESTAMP DEFAULT NOW(),
    foreign key (user_id) references users(id)
);

create table comments (
	id integer auto_increment primary key,
    comment_text varchar(999) not null,
    user_id integer not null,
    photo_id integer not null,
	created_at TIMESTAMP DEFAULT NOW(),
    foreign key (user_id) references users(id),
    foreign key (photo_id) references photos(id)
);

create table likes (
    user_id integer not null,
    photo_id integer not null,
	created_at TIMESTAMP DEFAULT NOW(),
    foreign key (user_id) references users(id),
    foreign key (photo_id) references photos(id),
    primary key (user_id, photo_id)
);

create table followers (
	folower_id integer not null,
    followed_id integer not null,
	created_at TIMESTAMP DEFAULT NOW(),
    foreign key (follower_id) references users(id),
    foreign key (followed_id) references users(id),
    primary key (follower_id, followed_id)
 );
 
create table tags (
	id integer not null primary key,
    tag_name varchar(200) unique,
	created_at TIMESTAMP DEFAULT NOW()
 );
 
 create table photo_tags (
	photo_id integer not null,
    tag_id integer not null,
	created_at TIMESTAMP DEFAULT NOW(),
    foreign key (tag_id) references tags(id),
    foreign key (photo_id) references photos(id),
    primary key (follower_id, followed_id)
 );
 