DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS lessons;
DROP TABLE IF EXISTS members;

CREATE TABLE members
(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  second_name VARCHAR(255),
  age INT4,
  status VARCHAR(255)
);

CREATE TABLE lessons
(
  id SERIAL8 primary key,
  title VARCHAR(255),
  day_time VARCHAR(255),
  capacity INT4
);

CREATE TABLE bookings
(
  id SERIAL8 primary key,
  member_id INT8 references members(id) ON DELETE CASCADE,
  lesson_id INT8 references lessons(id) ON DELETE CASCADE
);
