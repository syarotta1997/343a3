insert into questions values( 782, 
                                           'What do you promise when you take the oath of citizenship?',
                                           'MC',
                                           'To pledge your loyalty to the Sovereign, Queen Elizabeth II');
insert into MC_incorrect_answers values(782, 'To pledge your allegiance to the flag and fulfill the duties of a Canadian','Think regally.');
insert into MC_incorrect_answers values(782, 'To pledge your loyalty to Canada from sea to sea','');

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

insert into questions values( 625, 
                                           'What is the Underground Railroad?',
                                           'MC',
                                           'A network used by slaves who escaped the United States into Canada');
insert into MC_incorrect_answers values(625, 'The first railway to cross Canada',
                                                              'The Underground Railroad was generally south to north, not east-west.');
insert into MC_incorrect_answers values(625, 'The CPR''s secret railway line',
                                                              'The Underground Railroad was secret, but it had nothing to do with trains.');
insert into MC_incorrect_answers values(625, 'The TTC subway system',
                                                                     'The TTC is relatively recent; the Underground Railroad was in operation over 100 years ago.');
insert into questions values( 790, 
                                           'During the War of 1812 the Americans burned down the Parliament Buildings in
                                            York (now Toronto). What did the British and Canadians do in return?',
                                           'MC',
                                           'They burned down the White House in Washington D.C.');
insert into MC_incorrect_answers values(790, 'They attacked American merchant ships');
insert into MC_incorrect_answers values(790, 'They expanded their defence system, including Fort York');
insert into MC_incorrect_answers values(790, 'They captured Niagara Falls');

insert into room values(120, 'Mr Higgins');
insert into room values(366, 'Miss Nyers');

insert into student values('2222222222','Maisie','Williams');
insert into student values('0998801234','Lena','Headey');
insert into student values('0010784522','Peter','Dinklage');
insert into student values('0997733991','Emilia','Clarke');
insert into student values('5555555555','Kit','Harrington');
insert into student values('1111111111','Sophie','Turner');

insert into weight values(1, 601, 2);
insert into weight values(2, 566, 1);
insert into weight values(3, 790, 3);
insert into weight values(4, 625, 2);

insert into classes values(1, 1, 8, 120, '1111111111');
insert into classes values(2, 1, 8, 120, '0998801234');
insert into classes values(3, 1, 8, 120, '0010784522');
insert into classes values(4, 1, 8, 120, '0997733991');
insert into classes values(5, 1, 8, 120, '5555555555');
insert into classes values(6, 2, 5, 366, '2222222222');

insert into quiz values('Pr1-220310', 'Citizenship Test Practise Questions', True, '2017-10-01 13:30:00');

insert into quiz_assigned values(1,'Pr1-220310', 1, 1);
insert into quiz_assigned values(2,'Pr1-220310', 1, 2);
insert into quiz_assigned values(3,'Pr1-220310', 1, 3);
insert into quiz_assigned values(4,'Pr1-220310', 1, 4);

insert into quiz_assigned values(5,'Pr1-220310', 2, 1);
insert into quiz_assigned values(6,'Pr1-220310', 2, 2);
insert into quiz_assigned values(7,'Pr1-220310', 2, 3);
insert into quiz_assigned values(8,'Pr1-220310', 2, 4);

insert into quiz_assigned values(9,'Pr1-220310', 3, 1);
insert into quiz_assigned values(10,'Pr1-220310', 3, 2);
insert into quiz_assigned values(11,'Pr1-220310', 3, 3);
insert into quiz_assigned values(12,'Pr1-220310', 3, 4);

insert into quiz_assigned values(13,'Pr1-220310', 4, 1);
insert into quiz_assigned values(14,'Pr1-220310', 4, 2);
insert into quiz_assigned values(15,'Pr1-220310', 4, 3);
insert into quiz_assigned values(16,'Pr1-220310', 4, 4);

insert into quiz_assigned values(17,'Pr1-220310', 5, 1);
insert into quiz_assigned values(18,'Pr1-220310', 5, 2);
insert into quiz_assigned values(19,'Pr1-220310', 5, 3);
insert into quiz_assigned values(20,'Pr1-220310', 5, 4);

insert into response values(1, '1950');
insert into response values(2, 'False');
insert into response values(3, 'They expanded their defence system, including Fort York');
insert into response values(4, 'A network used by slaves who escaped the United States into Canada');

insert into response values(5, '1960');
insert into response values(6, 'False');
insert into response values(7, 'They burned down the White House in Washington D.C.');
insert into response values(8, 'A network used by slaves who escaped the United States into Canada');

insert into response values(9, '1960');
insert into response values(10, 'True');
insert into response values(11, 'They burned down the White House in Washington D.C.');
insert into response values(12, 'The CPR''s secret railway line');

insert into response values(13,'');
insert into response values(14, 'False');
insert into response values(15, 'They captured Niagara Falls');
insert into response values(16,'');

insert into response values(17,'');
insert into response values(18,'');
insert into response values(19,'');
insert into response values(20,'');


