drop database if exists oingo;
create database oingo;
use oingo;

create table account(
	id int primary key auto_increment,
	email varchar(255) not null,
	username varchar(32) not null,
	password varchar(72) not null, -- bcrypt's maximum length
	first varchar(32) not null,
	last varchar(32) not null,
	unique (email),
	unique (username),
	check (length(password) >= 50) -- bcrypt's minimum length
);

create table location(
	account_id int primary key,
	longitude decimal(11, 8) not null, -- [-180, 180]
	latitude decimal(10, 8) not null, -- [-90, 90]
	foreign key (account_id) references account(id)
);

create table friendship(
	account_1 int not null, -- 
	account_2 int not null,
	request_status varchar(8) not null,
	primary key (account_1, account_2),
	foreign key (account_1) references account(id),
	foreign key (account_2) references account(id),
	check (account_1 != account_2),
	check (request_status in ('APPROVED', 'PENDING', 'REJECTED'))
);

create table note(
	id int primary key auto_increment,
	account_id int not null,
	message TEXT not null,
	longitude decimal(11, 8) not null, -- [-180, 180]
	latitude decimal(10, 8) not null, -- [-90, 90]
	radius int not null,
	visibility varchar(7) not null,
	start_time timestamp not null,
	end_time timestamp not null,
	repetition varchar(5) not null, -- repeat is a keyword
	allow_comments boolean not null,
	unique (account_id, start_time, end_time, longitude, latitude, radius),
	foreign key (account_id) references account(id),
	check (repetition in ('DAY', 'WEEK', 'MONTH', 'YEAR', 'NONE')),
	check (start_time < end_time),
	check (radius > 0)
);

create table tag(
	id int primary key auto_increment,
	name varchar(32) not null
);

create table notetag(
	note_id int not null,
	tag_id int not null,
	primary key (note_id, tag_id),
	foreign key (note_id) references note(id),
	foreign key (tag_id) references tag(id)
);

create table comment(
	account_id int not null,
	note_id int not null,
	description varchar(4096) not null,
	primary key (account_id, note_id),
	foreign key (account_id) references account(id),
	foreign key (note_id) references note(id)
);

create table filter(
	id int primary key,
	account_id int not null,
	state_id int not null,
	start_time timestamp not null,
	end_time timestamp not null,
	longitude decimal(11, 8) not null,
	latitude decimal(10, 8) not null,
	radius int not null,
	tag_id int not null,
	unique (account_id, start_time, end_time, longitude, latitude, radius),
	foreign key (account_id) references account(id),
	foreign key (tag_id) references tag(id)
);

create table neighborhood(
	name varchar(128) not null,
	longitude decimal(11, 8) not null, -- [-180, 180]
	latitude decimal(10, 8) not null, -- [-90, 90]
	city varchar(255),
	state char(2) not null,
	unique (longitude, latitude),
	check (length(state) = 2)
);
