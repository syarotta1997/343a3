/*
Q2. For all questions in the database, report the question ID, question text, and the number of hints associated
with it. For True-False questions, report NULL as the number of hints (since True-False questions cannot have
hints).
*/
set search_path to quizschema;

select count(hint)
from quesitons left join MC_incorrect_answers as m on questions.question_id = m.quest_id 
                        left join NUM_incorrect_answers as n on quesitons.question_id = n.quest_id
group by questions.question_id;



    

