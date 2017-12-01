/* 
1. What constraints from the domain could not be enforced?

    I) Only a student in the class that was assigned a quiz can answer questions on that quiz.
        This constraint could not ever be enforced because it requires references of attrbutes 
        across different relations, which check does not support such operations in SQL.  

2. What constraints that could have been enforced were not enforced? Why not?
    I) Numeric questions can only have integer answers

           This constraint could be enforced by introducing sub-categories to answers
           such as create another table NUM_ANSWER with its text field restricted to 
           int type. However I chose not to do so because it will bring a great cost in having
           redundent information, also makes inserting data more complex for others  
    II)  A multiple choice question has answer options and there are always at least two.
     
         This constraint could also be enforced by splitting questions into sub-questions
         relations. But I did not do so with the same reason stated in II). With multiple relations
         relating to questions, inserting/defining Quiz, QuizBank and incorrect relations will be
         very diffcult and will also include redundent informations which we want to avoid.
         In addition, the feature of multiple choise has answer options is implemented within the
         relation Answers, as user can simply insert a new answer to a question with unique aid and
         answer text. The only problem is that there could be less than two answer options.

    III) For numeric questions, each hint is specific to a given range of values

        This constraint also deals with attribute formats, which can be resolved by introducing
        sub tables with context specific attribute types. However I did not implement this constraint 
        with the same reason in I).
 */
drop schema if exists quizschema cascade;
create schema quizschema;
set search_path to quizschema;

CREATE TABLE student(
sid int not null unique,
first_name varchar(50) not null,
last_name varchar(50) not null
check ( cast(sid as varchar(10)) like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

-- creating an extra relation to constraint that each room has at most one teacher
CREATE TABLE room(
rid int not null unique,
teacher varchar(50) not null
);

CREATE TABLE classes(
id int primary key,
classid int not null,
grade int,
room int references room(rid),
sid int not null references student(sid),
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

CREATE TABLE MC_incorrect_answers(
quest_id int not null references questions(question_id),
text varchar(255) not null,
hint varchar(255) not null,
unique(quest_id,text)
);

CREATE TABLE NUM_incorrect_answers(
quest_id int not null references questions(question_id),
lower_bound int not null,
upper_bound int not null,
hint varchar(255) not null,
check (lower_bound < upper_bound),
unique(quest_id,lower_bound,upper_bound)
);

CREATE TABLE quiz(
qid varchar(255) not null unique,
title varchar(255) not null,
allow_hint boolean,
due_date timestamp not null
);

CREATE TABLE weight(
id int primary key,
question_id int not null references questions(question_id),
weight int not null,
unique(question_id,weight)
);

CREATE TABLE quiz_assigned(
id int primary key,
qid varchar(255) not null references quiz(qid),
cid int not null references classes(id),
question_id int not null references weight(id),
unique(qid,cid)
);

CREATE TABLE response(
id int not null references quiz_assigned(id),
answer varchar(255) default ''
);