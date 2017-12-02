/* 
1. What constraints from the domain could not be enforced?

    I)  The constraint that a student id has to be numeric could not be enforced
        - if we store the attribute directly as integer, SQL will auto-omit leading 0's which we do
            not desire
        - if we store the attrbute as string, we can enforce that it is 10 in length, but cannot guarantee
           that all strings chars are digits.

    II) Numeric questions can only have integer answers
           In seek to avoid null and redunduncy, I aim to organize all questions and their answers within as few
           tables as possible for easy data retrievals, thus for all questions I am only using one varchar attribute to store
           such. In fact this problem can be fixed using a trigger, but since this assignment does not require the usage
           of triggers, I decided to not enforce this constraint. 

2. What constraints that could have been enforced were not enforced? Why not?

        I)  A multiple choice question has answer options and there are always at least two.

            Based on the current design of the schema, this feature in theory can be implemented by having questions
            and MC_incorrect_answers referencing each other's id keys. But I chose not to do so because this would allow
            null value to be inserted as the key. In this design the highest priority is to avoid null attributes and redundency.

        II) A quiz has at least one question in it
            This constraint is not directly enfored in the quiz table because doing so will bring great cost for redundency
            (imagine getting set of data with repreating quiz id, title, time, etc with last attributes as the differing questions)
            thus I chose to indirectly enforce this property by having quiz_assigned table, which has two key constraints 
            to each of weight (that stores a sprcific weight of a question) and the quiz it self (the primary id key). By adding
            the not null contraint, I am somehow enforcing that when the quiz is assigned to its class, all student will
            have at least one question to answer.
 */
drop schema if exists quizschema cascade;
create schema quizschema;
set search_path to quizschema;

-- A relation of pure student information
CREATE TABLE student(
sid varchar(10) not null unique,
first_name varchar(50) not null,
last_name varchar(50) not null
-- check constraint that id is 10 units in length
check (length(sid) = 10 )
);

-- creating an extra relation Room to constraint that each room has at most one teacher
CREATE TABLE room(
rid int not null unique,
teacher varchar(50) not null
);

-- This table contains the student's relation to a class and its property room/grade
-- using classid and sid as a key, enforcing that no student with same class appear twice in the table with
-- different id (this is important because the id is used as an identifier for quiz to determine if the
-- student is eligible to write the quiz)
CREATE TABLE classes(
-- this primary key is referred by quiz_assigned in order to constaint student's validity to write a quiz
id int primary key,
classid int not null,
grade int,
room int references room(rid),
sid varchar(10) not null references student(sid),
-- key
unique(classid,sid)
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
text varchar(255) not null,
q_type question_type not null,
correct_ans varchar(255) not null
);
-- A relation that stores only MC incorrect answers with optional hint attribute
CREATE TABLE MC_incorrect_answers(
quest_id int not null references questions(question_id),
text varchar(255) not null,
hint varchar(255),
unique(quest_id,text)
);
-- A relation that stores only numeric question's incorrect answers
CREATE TABLE NUM_incorrect_answers(
quest_id int not null references questions(question_id),
--range bounds of range for hint
lower_bound int not null,
upper_bound int not null,
hint varchar(255),
check (lower_bound < upper_bound),
unique(quest_id,lower_bound,upper_bound)
);

CREATE TABLE quiz(
qid varchar(255) not null unique,
title varchar(255) not null,
allow_hint boolean,
due_date timestamp not null
);
-- A relation used to store all differing weights for questions
-- supports same question with different weight to be used in different quizzes
CREATE TABLE weight(
id int primary key,
question_id int not null references questions(question_id),
weight int not null,
unique(question_id,weight)
);
-- relation table that links quiz, questions+weight and the class assigned together
CREATE TABLE quiz_assigned(
id int primary key,
qid varchar(255) not null references quiz(qid),
-- this cid will refer to a tuple of format (classid, student id), which is used to put
-- constraint on who is able to write the quiz
cid int not null references classes(id),
wid int not null references weight(id),
--the following is just to enforce no same tuple will get differnt primary id keys
unique(qid,cid,wid)
);
-- relation that records student's answers to a certain question in a certain quiz
CREATE TABLE response(
-- all information has been linked, just refer to its id
id int not null references quiz_assigned(id),
answer varchar(255) not null
);