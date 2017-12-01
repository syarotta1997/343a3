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

insert into quiz values('Pr1-220310', 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00', );
insert into quiz_bank('Pr1-220310',601,2);
insert into quiz_bank('Pr1-220310',566,2);
insert into quiz_bank('Pr1-220310',790,2);
insert into quiz_bank('Pr1-220310',625,2);
insert into classes(1,8,120, );
