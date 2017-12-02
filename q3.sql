/*
Q3. Compute the grade and total score on quiz Pr1-220310 for every student in the grade 8 class in room 120 with
Mr Higgins. Report the student number, last name, and total grade.
*/
set search_path to quizschema;

DROP VIEW IF EXISTS class_higgins CASCADE;
DROP VIEW IF EXISTS student_response CASCADE;
DROP VIEW IF EXISTS scores CASCADE;
DROP VIEW IF EXISTS no_scores CASCADE;
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
                join response on response.id = quiz_assigned.id;
-- create table and count total weights as total grade for students who have answer at least one question correctly
create view scores as
select sid, sum(sr.weight) as total_grade
from student_response as sr left join questions as q on sr.question_id = q.question_id
where sr.answer = q.correct_ans
group by sid;
-- from the schema we assume that all students in the same class have been assigned the same quiz, then
-- for those who happen to have no response (missed the quiz or just did not answer at all)
-- or 0 correctly answered questions, simply given them 0 as mark
create view no_scores as
select sid, 0 as total_grade
from (select sid from class_higgins except select sid from scores) as no_answer;

select student.sid as student_number, student.last_name as last_name, results.total_grade
from (select * from scores union select * from no_scores) results join student on results.sid = student.sid;





    

