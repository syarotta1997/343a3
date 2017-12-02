/*
Q2. For all questions in the database, report the question ID, question text, and the number of hints associated
with it. For True-False questions, report NULL as the number of hints (since True-False questions cannot have
hints).
*/
set search_path to quizschema;

DROP VIEW IF EXISTS TF_hint CASCADE;
DROP VIEW IF EXISTS hints CASCADE;

create view TF_hint as
select questions.question_id as question_ID, NULL as hint_count
from questions
where questions.q_type = 'TF';

create view hints as
select other_hints.question_id as question_ID, count(other_hints.hint) as hint_count
from ( select question_id, hint from questions as q  join MC_incorrect_answers as m 
                                                                                                   on q.question_id = m.quest_id
          union 
          select question_id, hint from questions as q  join NUM_incorrect_answers as n 
                                                                                                   on q.question_id = n.quest_id) 
          as other_hints;

select *
from TF_hint union hints;




    

