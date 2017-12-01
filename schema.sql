drop schema if exists quizschema cascade;
create schema quizschema;
set search_path to quizschema;

CREATE TABLE student(
sid int not null unique,
first_name varchar(50) not null,
last_name varchar(50) not null
);

-- creating an extra relation to constraint that each room has at most one teacher
CREATE TABLE room(
rid int not null unique,
teacher varchar(50) not null
);

CREATE TABLE classes(
id int primary key,
grade int not null,
room int not null references room(rid),
student int REFERENCES student(sid),
unique(id,student)
);

/*
-- type enums 
MC = multiple choice
TF = true / false 
NUM = numeric questions
*/
CREATE TYPE question_type AS ENUM(
	'MC', 'TF', 'NUM');

CREATE TABLE questions(
question_id int not null unique,
text varchar(50) not null,
q_type question_type not null,
correct_ans int not null
);

CREATE TABLE answers(
aid int not null unique,
quest_id int not null references questions(question_id),
text varchar(50) not null,
unique(aid,quest_id)
);

CREATE TABLE quiz(
quiz_id varchar(50) not null unique,
title varchar(50) not null,
allow_hint boolean,
due_date date not null,
cid int references classes(id)
);

CREATE TABLE quiz_bank(
qid varchar(50) not null references quiz(quiz_id),
question_id int not null references questions(question_id),
weight int not null,
unique(qid, question_id)
);

CREATE TABLE incorrect_answers(
quest_id int not null references questions(question_id),
aid int not null references answers(aid),
hint varchar(50) not null,
unique(aid,quest_id)
);

CREATE TABLE response(
qid varchar(50) not null references quiz(quiz_id),
sid int not null references student(sid),
quest_id int not null references questions(question_id),
answer varchar(50) default '',
unique(qid,sid,quest_id)
);