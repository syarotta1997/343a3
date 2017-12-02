/*
Q3. Compute the grade and total score on quiz Pr1-220310 for every student in the grade 8 class in room 120 with
Mr Higgins. Report the student number, last name, and total grade.
*/
set search_path to quizschema;

DROP VIEW IF EXISTS class_higgins CASCADE;

create view class_higgins as
select *
from classes join room on classes.room = room.rid
where room.rid = 120 and room.teacher = 'Mr Higgins' and classes.grade = 8;

select *
from quiz join quiz_assigned on quiz.qid = quiz_assigned.qid
                join weight on quiz_assigned.question_id = weight.id;




    

