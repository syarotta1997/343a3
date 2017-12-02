/*
Q1. Report the full name and student number of all students in the database.
*/
set search_path to quizschema;

select first_name || last_name as student_name, sid as student_number
from student;



    

