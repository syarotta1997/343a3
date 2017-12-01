insert into questions values( 782, 
                                           'What do you promise when you take the oath of citizenship?',
                                           'MC',
                                           'To pledge your loyalty to the Sovereign, Queen Elizabeth II');
insert into MC_incorrect_answers values(782, 'To pledge your allegiance to the flag and fulfill the duties of a Canadian','Think regally.');
insert into MC_incorrect_answers values(782, 'To pledge your loyalty to Canada from sea to sea',null);

insert into questions values( 566, 
                                           'The Prime Minister, Justin Trudeau, is Canada''s Head of State.?',
                                           'TF',
                                           'False');

insert into questions values( 601, 
                                           'During the "Quiet Revolution," Quebec experienced rapid change. In what
                                            decade did this occur? (Enter the year that began the decade, e.g., 1840.)',
                                           'NUM',
                                           '1960');

insert into NUM_incorrect_answers values(601, 1800,1900, 'The Quiet Revolution happened during the 20th Century.');
insert into NUM_incorrect_answers values(601, 2000,2010, 'The Quiet Revolution happened some time ago.');
insert into NUM_incorrect_answers values(601, 2020,3000, 'The Quiet Revolution has already happened!');

insert into questions values( 782, 
                                           'What is the Underground Railroad?',
                                           'MC',
                                           'A network used by slaves who escaped the United States into Canada');
insert into MC_incorrect_answers values(782, 'The first railway to cross Canada','The Underground Railroad was generally south to north, not east-west.');
insert into MC_incorrect_answers values(782, 'The CPR''s secret railway line','The Underground Railroad was secret, but it had nothing to do with trains.');
insert into MC_incorrect_answers values(782, 'The TTC subway system','The TTC is relatively recent; the Underground Railroad was in operation over 100 years ago.');
insert into questions values( 790, 
                                           'During the War of 1812 the Americans burned down the Parliament Buildings in
                                            York (now Toronto). What did the British and Canadians do in return?',
                                           'MC',
                                           'They burned down the White House in Washington D.C.');
insert into MC_incorrect_answers values(782, 'They attacked American merchant ships',null);
insert into MC_incorrect_answers values(782, 'They expanded their defence system, including Fort York',null);
insert into MC_incorrect_answers values(782, 'They captured Niagara Falls',null);

insert into room(120, 'Mr Higgins');
insert into room(366, 'Miss Nyers');

insert into student(2222222222,'Maisie','Williams');
insert into student(0998801234,'Lena','Headey');
insert into student(0010784522,'Peter','Dinklage');
insert into student(0997733991,'Emilia','Clarke');
insert into student(5555555555,'Kit','Harrington');
insert into student(1111111111,'Sophie','Turner');

insert into weight(1, 601, 2);
insert into weight(2, 566, 1);
insert into weight(3, 790, 3);
insert into weight(4, 625, 2);

insert into classes(1, 1, 8, 120, 1111111111);
insert into classes(2, 1, 8, 120, 0998801234);
insert into classes(3, 1, 8, 120, 0010784522);
insert into classes(4, 1, 8, 120, 0997733991);
insert into classes(5, 1, 8, 120, 5555555555);
insert into classes(6, 2, 5, 366, 2222222222)

insert into quiz(1, 'Pr1-220310', 1, 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00', 1);
insert into quiz(2, 'Pr1-220310', 1, 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00', 2);
insert into quiz(3, 'Pr1-220310', 1, 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00', 3);
insert into quiz(4, 'Pr1-220310', 1, 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00', 4);

insert into quiz(1, 'Pr1-220310', 2, 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00', 1);
insert into quiz(2, 'Pr1-220310', 2, 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00', 2);
insert into quiz(3, 'Pr1-220310', 2, 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00', 3);
insert into quiz(4, 'Pr1-220310', 2, 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00', 4);

insert into quiz(1, 'Pr1-220310', 3, 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00', 1);
insert into quiz(2, 'Pr1-220310', 3, 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00', 2);
insert into quiz(3, 'Pr1-220310', 3, 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00', 3);
insert into quiz(4, 'Pr1-220310', 3, 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00', 4);

insert into quiz(1, 'Pr1-220310', 4, 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00', 1);
insert into quiz(2, 'Pr1-220310', 4, 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00', 2);
insert into quiz(3, 'Pr1-220310', 4, 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00', 3);
insert into quiz(4, 'Pr1-220310', 4, 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00', 4);

insert into quiz(1, 'Pr1-220310', 5, 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00', 1);
insert into quiz(2, 'Pr1-220310', 5, 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00', 2);
insert into quiz(3, 'Pr1-220310', 5, 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00', 3);
insert into quiz(4, 'Pr1-220310', 5, 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00', 4);
