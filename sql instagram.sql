Create table users(
user_id Serial Primary Key,
name varchar(50) NOT NULL,
email varchar(50) Unique NOT NULL,
phone_number varchar(50) unique
);

Create table posts(
post_id serial primary key,
user_id integer not null,
caption text,
image_url varchar(200),
created_at timestamp default current_timestamp,
foreign key (user_id) references users(user_id)
);

Create table Comments(
comment_id serial primary key,
post_id integer not null,
user_id integer not null,
comment_text text,
created_at timestamp default current_timestamp,
foreign key (user_id) references users(user_id),
foreign key (post_id) references posts(post_id)
);

Create table likes(
like_id serial primary key,
post_id integer not null,
user_id integer not null,
created_at timestamp default current_timestamp,
foreign key (post_id) references posts(post_id),
foreign key (user_id) references users(user_id)
);

Create table followers(
Follower_id serial primary key,
user_id integer not null,
follower_user_id integer not null,
created_at timestamp default current_timestamp,
foreign key (user_id) references posts(post_id),
foreign key (follower_user_id) references users(user_id)
);
INSERT INTO Users (name, email, phone_number)
VALUES
    ('John Smith', 'johnsmith@gmail.com', '1234567890'),
    ('Jane Doe', 'janedoe@yahoo.com', '0987654321'),
    ('Bob Johnson', 'bjohnson@gmail.com', '1112223333'),
    ('Alice Brown', 'abrown@yahoo.com', NULL),
    ('Mike Davis', 'mdavis@gmail.com', '5556667777');

INSERT INTO Posts (user_id, caption, image_url)
VALUES
    (1, 'Beautiful sunset', '<https://www.example.com/sunset.jpg>'),
    (2, 'My new puppy', '<https://www.example.com/puppy.jpg>'),
    (3, 'Delicious pizza', '<https://www.example.com/pizza.jpg>'),
    (4, 'Throwback to my vacation', '<https://www.example.com/vacation.jpg>'),
    (5, 'Amazing concert', '<https://www.example.com/concert.jpg>');

INSERT INTO Comments (post_id, user_id, comment_text)
VALUES
    (1, 2, 'Wow! Stunning.'),
    (1, 3, 'Beautiful colors.'),
    (2, 1, 'What a cutie!'),
    (2, 4, 'Aww, I want one.'),
    (3, 5, 'Yum!'),
    (4, 1, 'Looks like an awesome trip.'),
    (5, 3, 'Wish I was there!');

INSERT INTO Likes (post_id, user_id)
VALUES
    (1, 2),
    (1, 4),
    (2, 1),
    (2, 3),
    (3, 5),
    (4, 1),
    (4, 2),
    (4, 3),
    (5, 4),
    (5, 5);
	-- Inserting into Followers table
INSERT INTO Followers (user_id, follower_user_id)
VALUES
    (1, 2),
    (2, 1),
    (1, 3),
    (3, 1),
    (1, 4),
    (4, 1),
    (1, 5),
    (5, 1);