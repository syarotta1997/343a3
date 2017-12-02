/*
Q5. For each question on quiz Pr1-220310, report the number of students in the grade 8 class in room 120 with
Mr Higgins who got the question right, the number who got it wrong, and the number who did not answer it.

*/
set search_path to quizschema;

DROP VIEW IF EXISTS class_higgins CASCADE;
DROP VIEW IF EXISTS student_response CASCADE;
DROP VIEW IF EXISTS correct CASCADE;
DROP VIEW IF EXISTS incorrect CASCADE;
DROP VIEW IF EXISTS no_ans CASCADE;
-- first we get the class_member id of all students from specified class
create view class_higgins as
select id,sid
from classes join room on classes.room = room.rid
where room.rid = 120 and room.teacher = 'Mr Higgins' and classes.grade = 8;
-- collect data of all selected student reaponses from the quiz by joining revelant tables
create view student_response as
select sid, weight.question_id, weight.weight, response.answer
from quiz join quiz_assigned on quiz.qid = quiz_assigned.qid
                join weight on quiz_assigned.wid = weight.id
                join class_higgins on quiz_assigned.cid = class_higgins.id
                join response on response.id = quiz_assigned.id
where quiz.qid = 'Pr1-220310';
-- create table and count total weights as total grade for students who have answer at least one question correctly
create view correct as
select count(sid) as counts, q.question_id
from student_response as sr left join questions as q on sr.question_id = q.question_id
where sr.answer = q.correct_ans
group by q.question_id;

create view incorrect as
select count(sid) as counts, q.question_id
from student_response as sr left join questions as q on sr.question_id = q.question_id
where sr.answer <> q.correct_ans and sr.answer <> ''
group by q.question_id;
-- from the schema we assume that all students in the same class have been assigned the same quiz, then
-- for those who happen to have no response (missed the quiz or just did not answer at all)
-- or 0 correctly answered questions, simply given them 0 as mark
create view no_ans as
select count(sid) as counts, q.question_id
from student_response as sr left join questions as q on sr.question_id = q.question_id
where sr.answer = ''
group by q.question_id;

select *
from correct full join incorrect on correct.question_id = incorrect. question_id 
                    full join no_ans on correct.question_id = no_ans. question_id 
group by correct.question_id;





    

