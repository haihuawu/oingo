use oingo;


insert into account(email, username, password, first, last) values 
				("whh.annsempre@gmail.com" , "asempre", "12345678901234567890123456789012345678901234567890" , "Haley" , "Wu"),
				("xiaoli@gmail.com" , "XL", "135790AAAAA135790AAAAA135790AAAAA135790AAAAA135790AAAAA" , "Xiao" , "Li"),
				("ziyi.zhang@gmail.com", "ZYZHANG", "iamziyizhangiamziyizhangiamziyizhangiamziyizhangiamziyizhang", "Ziyi", "Zhang");

insert into friendship(account_1, account_2, request_status) values
				(1, 2, "APPROVED"),
				(1, 3, "PENDING"),
				(2, 3, "REJECTED");

insert into note(message, radius, visibility, start_time, end_time, repetition, allow_comments) values
				("This bakery shop is amazing!", 100, 'FRIENDS', '2018-11-27 00:00:01', '2018-11-30 23:59:59', 'DAY', true),
				("Meeting at Metro Tech 5.", 100, 'SELF', '2018-11-29 12:00:00', '2018-11-29 12:30:00', 'DAY', false),
				("Free ticket for Wangfeng's concert. Message me.", 300, 'PUBLIC', '2018-03-01 00:00:01', '2018-12-30 23:59:59', 'WEEK', true);

insert into location(neighborhood, longitude, latitude) values
				("Harbs", -73.958030, 40.773860),
				("5 MetroTech Center", -73.985630, 40.694460),
				("Beijing Olympic Park", 116.461243, 40.246380);

insert into note_location(note_id, location_id) values
				(1, 1),
				(2, 2),
				(3, 3);

insert into post(account_id, note_id) values
				(1, 1),
				(2, 2),
				(3, 3);

insert into tag(name) values
				("food"),
				("self"),
				("concert"),
				("music");

insert into note_tag(note_id, tag_id) values
				(1, 1),
				(2, 2),
				(3, 3),
				(3, 4);

insert into comment(account_id, note_id, description) values
				(2, 1, "Nice! I like the cake."),
				(1, 3, "Great, can you help me know how to get the free ticket?");

insert into state(start_time, end_time, description) values
				('2018-11-27 11:00:00', '2018-11-27 13:00:00', "lunch break"),
				('2018-11-29 12:00:00', '2018-11-29 12:30:00', "at work"),
				('2018-08-29 12:00:00', '2018-11-30 12:30:00', "just chilling"); 

insert into filter(account_id, state_id, start_time, end_time, longitude, latitude, radius, tag_id) values
				(2, 1, '2018-11-27 11:00:00', '2018-11-27 13:00:00', -73.958031, 40.773861, 50, 1),
				(2, 2, '2018-11-29 12:00:00', '2018-11-29 12:30:00', -73.9856, 40.6944, 100, 2);


