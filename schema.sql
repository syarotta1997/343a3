/* 

 */
drop schema if exists quizschema cascade;
create schema quizschema;
set search_path to quizschema;

CREATE TABLE student(
id int primary key,
sid int not null unique,
first_name varchar(50) not null,
last_name varchar(50) not null
);

CREATE TABLE classes(
id int primary key,
grade int not null,
room int not null,
teacher varchar(50) not null,
student int REFERENCES student(sid),
unique(id,student),
/* 
The following constraint checks only one room has at most 1 teacher
*/
CHECK(not exists
                (select *
                 from class as c1, class as c2
                 where c1.room = c2.room and c1.teacher != c2.teacher))
);

CREATE TABLE quiz(
id int primary key,
quiz_id varchar(50) not null unique,
title varchar(50) not null,
allow_hint boolean,
due_date date not null,
cid int references class(id)
);

CREATE TABLE quiz_bank(
id int primary key,
qid varchar(50) not null references quiz(quiz_id),
question_id int not null references questions(question_id),
weight int not null,
unique(qid, question_id)
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
id int primary key,
quesiton_id int not null unique,
text varchar(50) not null,
q_type question_type not null,
correct_ans int not null references answers(aid)
);

CREATE TABLE answers(
aid int primary key,
quest_id int not null references questions(question_id),
text varchar(50) not null,
unique(aid,quest_id)
);

CREATE TABLE incorrect_answers(
quest_id int not null references questions(question_id),
aid int not null references answers(aid),
hint varchar(50) not null,
unique(aid,quest_id)
);

CREATE TABLE response(
id int primary key,
qid varchar(50) not null references quiz(quiz_id),
quest_id int not null references questions(question_id),
student int REFERENCES student(sid),
answer varchar(50) set default ''
unique(qid,quest_id,student)
/* 
The following constraint checks only a student in the class that was assigned 
a quiz can answer questions on that quiz
*/
CHECK (not exists
                ((select unique student
                 from response)
                 except
                 (select unique sid from response join quiz on response.qid = quiz.quiz_id 
                                                        join classes on quiz.cid = classes.id)
                )   
            )
);

