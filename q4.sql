/*
Q4. For every student in the grade 8 class in room 120 with Mr Higgins, and every question from quiz Pr1-220310
that they did not answer, report the student ID, the question ID, and the question text.
*/
set search_path to quizschema;

DROP VIEW IF EXISTS class_higgins CASCADE;
DROP VIEW IF EXISTS student_response CASCADE;
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
select sid as student_id, q.question_id, q.text
from student_response as sr left join questions as q on sr.question_id = q.question_id
where sr.answer = ''
group by sid, q.question_id, q.text;





    

