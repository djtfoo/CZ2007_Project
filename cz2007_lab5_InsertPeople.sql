use ssp1g3;
GO


--Insert State, City, and Addresses--
INSERT INTO State VALUES ('Singapore');
INSERT INTO City VALUES ('Singapore' , 'Singapore');
INSERT INTO Address(person_address, zip) VALUES ('445 Clementi Ave 3 #01-173' , '120445');
INSERT INTO Address(person_address, zip) VALUES ('Block 26 Ayer Rajah Crescent 03-08', '139944');
INSERT INTO Address(person_address, zip) VALUES ('179 River Valley Road #05-13 River Valley Building', '179033');
INSERT INTO Address(person_address, zip) VALUES ('1002 Jalan Bukit Merah #02-01/03' , '159456');
INSERT INTO Address(person_address, zip) VALUES ('20 Upper Circular Road #03-06A The Riverwalk' , '058416');
INSERT INTO Address(person_address, zip) VALUES ('101 Thomson Road #07-02 UNITED SQUARE' , '307591');
INSERT INTO Address(person_address, zip) VALUES ('133 New Bridge Road 12-07 Chinatown Point' , '059413');
INSERT INTO Address(person_address, zip) VALUES ('3 Shenton Way #10-05 SHENTON HOUSE' , '068805');
INSERT INTO Address(person_address, zip) VALUES ('19 Kim Keat Road #02-08 Fu Tsu Building' , '328804');
INSERT INTO Address(person_address, zip) VALUES ('180 Clemenceau Avenue #06-01 HAW PAR CENTRE' , '239922');
INSERT INTO Address(person_address, zip) VALUES ('#01-1195 , Blk 12 Toa Payoh Ind Pk Lor 8' , '319064');
INSERT INTO Address(person_address, zip) VALUES ('460 Alexandra Road #38-00 Psa Building' , '119963');
INSERT INTO Address(person_address, zip) VALUES ('110A Killiney Road TAI WAH BUILDING' , '239549');
INSERT INTO Address(person_address, zip) VALUES ('317 Outram Road B1-23 Holiday Inn Atrium' , '169075');
INSERT INTO Address(person_address, zip) VALUES ('1 Hougang Street 91 #01-41 HOUGANG FESTIVAL MARKET' , '538692');
INSERT INTO Address(person_address, zip) VALUES ('620A, Lor 1 Toa Payoh' , '319762');
INSERT INTO Address(person_address, zip) VALUES ('20 Ayer Rajah Crescent #04-04 TECHNOPRENEUR CENTRE' , '139964');
INSERT INTO Address(person_address, zip) VALUES ('455 Hougang Ave 10 #08-449', '530455');

--Insert Stakeholders--
INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
VALUES ('S7756201I', 'Long Zi', '445 Clementi Ave 3 #01-173', '6567755182', 'lozi0058@e.ntu.edu.sg', 'public');

INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
VALUES ('S6674993I', 'Zhi Duan', 'Block 26 Ayer Rajah Crescent 03-08', '6567772170', 'zhid0122@e.ntu.edu.sg', 'government');

INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
VALUES ('S6575203I', 'Jiahao Zheng', '179 River Valley Road #05-13 River Valley Building', '6563380863', 'jiaz0502@e.ntu.edu.sg', 'industry partners');

INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
VALUES ('S9221012D', 'Low Zhengyuan', '455 Hougang Ave 10 #08-449', '6593217765', 'tanz0101@e.ntu.edu.sg', 'public');

INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
VALUES ('S7088201C', 'Lee Kong Nam', '455 Hougang Ave 10 #08-449', '6581216626', 'lkn@finfund.edu.sg', 'funding agency');


--Insert Person In School--
INSERT INTO Person_In_School VALUES('S9534183H', 'School of Civil and Environmental Engineering');
INSERT INTO Person_In_School VALUES('S9434566H', 'School of Chemical and Biomedical Engineering');
INSERT INTO Person_In_School VALUES('S9534185H','School of Physical and Mathematical Sciences');
INSERT INTO Person_In_School VALUES ('S9534182H', 'School of Computer Science and Engineering');
INSERT INTO Person_In_School VALUES ('S9438012H', 'School of Computer Science and Engineering');
INSERT INTO Person_In_School VALUES ('S9310372A', 'School of Computer Science and Engineering');
INSERT INTO Person_In_School VALUES ('S9845371C', 'School of Materials Science and Engineering');
INSERT INTO Person_In_School VALUES ('S9811102A', 'School of Chemical and Biomedical Engineering');
INSERT INTO Person_In_School VALUES ('S9822170Z', 'School of Chemical and Biomedical Engineering');
INSERT INTO Person_In_School VALUES ('S8945371A', 'School of Computer Science and Engineering');
INSERT INTO Person_In_School VALUES ('S8525200Z', 'School of Computer Science and Engineering');
INSERT INTO Person_In_School VALUES ('S8809791A', 'School of Computer Science and Engineering');
INSERT INTO Person_In_School VALUES ('S6878903I', 'School of Computer Science and Engineering');
INSERT INTO Person_In_School VALUES ('S7255001I', 'School of Materials Science and Engineering');
INSERT INTO Person_In_School VALUES ('S6808102I', 'School of Chemical and Biomedical Engineering');


--UPDATE Teaching_Lab purposes--
UPDATE Teaching_Lab SET purpose = 'Software' WHERE Tlab_name LIKE '%Software%';
UPDATE Teaching_Lab SET purpose = 'Hardware' WHERE Tlab_name LIKE '%Hardware%';

--UPDATE Research_Lab types--
UPDATE Research_Lab SET type = 'R&D' WHERE Rlab_name IN ('Cyber Security Lab', 'Parallel & Distributed Computing Lab', 'Computational Intelligence Lab', 'Hardware & Embedded Systems Lab', 'Computer Networks & Communications Lab');
UPDATE Research_Lab SET type = 'Data Analytics' WHERE Rlab_name IN ('Biomedical Informatics Lab', 'Data Management & Analytics Lab');
UPDATE Research_Lab SET type = 'Applied' WHERE Rlab_name IN ('Multimedia & Interactive Computing Lab');


--------stakeholder start------
--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S9438012H', 'Luoyang Teng' , '3 Shenton Way #10-05 SHENTON HOUSE' , '6567338537' , 'luot2543@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S9534182H', 'Jiang Shao' , '133 New Bridge Road 12-07 Chinatown Point' , '6563335788' , 'jias0011@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S9534183H' , 'Xiang Shao' , '133 New Bridge Road 12-07 Chinatown Point' , '6563335788' , 'xias0011@e.ntu.edu.sg' , 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S9534185H' , 'ZhenXiang Shao' , '133 New Bridge Road 12-07 Chinatown Point' , '6563335789' , 'zhxsh0011@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S9434566H' , 'Nanyang Teng' , '3 Shenton Way #10-05 SHENTON HOUSE' , '6567338345' , 'nanyangt2543@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S9310372A' , 'Feng Xue' , '19 Kim Keat Road #02-08 Fu Tsu Building' , '6562957230' , 'fexu0005@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S9845371C' , 'Yu Xing' , '180 Clemenceau Avenue #06-01 HAW PAR CENTRE' , '6563353388' , 'yuxi0027@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S9811102A' , 'Wuying Kong' , '#01-1195 , Blk 12 Toa Payoh Ind Pk Lor 8' , '6562563631' , 'wuko0075@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S9822170Z' , 'Xuegang Guo' , '460 Alexandra Road #38-00 Psa Building' , '6562747111' , 'xugu1027@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S8945371A' , 'Song Tian' , '110A Killiney Road TAI WAH BUILDING' , '6562353660' , 'soti0051@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S8525200Z' , 'Fu Liao' , '317 outram road b1-23 holiday inn atrium' , '6563336754' , 'fuli0211@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S8809791A' , 'Yi Xiao' , '1 Hougang Street 91 #01-41 HOUGANG FESTIVAL MARKET' , '6568811020' , 'yi0057xi@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S8932771E' , 'Jie Shen' , '620A, Lor 1 Toa Payoh' , '6568823000' , 'jish0082@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S8548701A' , 'Wen Hu' , '20 Ayer Rajah Crescent #04-04 TECHNOPRENEUR CENTRE' , '6567799400' , 'wehu0032@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S8778021Z' , 'Yuhan Cai' , '445 Clementi Ave 3 #01-173' , '6567755182' , 'yuca0115@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S6674993I' , 'Zhi Duan' , 'Block 26 Ayer Rajah Crescent 03-08' , '6567772170' , 'zhid0122@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S6878903I' , 'Xieren Wan' , '1002 Jalan Bukit Merah #02-01/03' , '6562708850' , 'xi3100an@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S7255001I' , 'Guiying Pan' , '20 Upper Circular Road #03-06A The Riverwalk' , '6565133301' , 'gupa3001@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S6808102I' , 'Bi Gong' , '101 Thomson Road #07-02 UNITED SQUARE' , '6562518211' , 'bi0088go@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S9954754O' , 'Yan Long' , '2 Corporation Road #03-09/11 Corporation Place' , '62621111' , 'yl1976@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S9953456H' , 'Liang Hu' , '321B Jln Besar' , '62959310' , 'liang4346@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S7253456H' , 'ZhenKang  Pan' , '23 Defu Lane 12' , '62836363' , 'pzk0098@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S7853464H' , 'He Hou' , '132 PANDAN LOOP BLK 9' , '67793338' , 'taihou@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S7185346H' , 'Xinyi Pan' , '6 Tuas View Lane' , '68618025' , 'panjinlian@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S7985346H' , 'Yahui Hao' , '7 Maxwell Rd #05-02A' , '62233768' , 'haoliyou@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S7685666H' , 'Bao Ma' , '#11-25, Maxwell House' , '63230936' , 'bmw@e.ntu.edu.sg', 'public');

--INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
--VALUES ('S6777666H' , 'Zemin Xian' , '42A,Upper Dickson Road' , '96190505' , 'xianzem@e.ntu.edu.sg', 'public');

-----------stakeholder end----------

-------address start-----

INSERT INTO Address(person_address, zip)
VALUES ('2 Corporation Road #03-09/11 Corporation Place', '618494'); 

INSERT INTO Address(person_address, zip)
VALUES ('321B Jln Besar', '208979'); 

INSERT INTO Address(person_address, zip)
VALUES ('23 Defu Lane 12', '539130');

INSERT INTO Address(person_address, zip)
VALUES ('132 PANDAN LOOP BLK 9', '128334'); 

INSERT INTO Address(person_address, zip)
VALUES ('6 Tuas View Lane', '637566'); 

INSERT INTO Address(person_address, zip)
VALUES ('7 Maxwell Rd #05-02A', '069111'); 


INSERT INTO Address(person_address, zip)
VALUES ('#11-25, Maxwell House', '069113'); 

INSERT INTO Address(person_address, zip)
VALUES ('42A,Upper Dickson Road', '207499'); 

-------address end------


----Undergrad start----
INSERT INTO UndergradPerson(person_ID, person_name, person_address, phone, email, student_ID, admission_date, major, minor, GPA)
VALUES ('S9845371C' , 'Yu Xing' , '180 Clemenceau Avenue #06-01 HAW PAR CENTRE' , '6563353388' , 'yuxi0027@e.ntu.edu.sg', 'U1823425I', '2018-08-12', 'Material Science', 'Business', 4.36);

INSERT INTO UndergradPerson(person_ID, person_name, person_address, phone, email, student_ID, admission_date, major, minor, GPA)
VALUES ('S9811102A' , 'Wuying Kong' , '#01-1195 , Blk 12 Toa Payoh Ind Pk Lor 8' , '6562563631' , 'wuko0075@e.ntu.edu.sg','U1853434K', '2018-08-12', 'Chemical Engineering', 'Accountancy', 3.98);

INSERT INTO UndergradPerson(person_ID, person_name, person_address, phone, email, student_ID, admission_date, major, minor, GPA)
VALUES ('S9822170Z' ,  'Xuegang Guo' , '460 Alexandra Road #38-00 Psa Building' , '6562747111' , 'xugu1027@e.ntu.edu.sg', 'U1854445O', '2018-08-12', 'Biomedical Engineering',NULL, 4.87);

INSERT INTO UndergradPerson(person_ID, person_name, person_address, phone, email, student_ID, admission_date, major, minor, GPA)
VALUES ('S9954754O' , 'Yan Long' , '2 Corporation Road #03-09/11 Corporation Place' , '62621111' , 'yl1976@e.ntu.edu.sg', 'U1845353L', '2018-08-12', 'Electronic and Electrical Engineering', 'Business', 3.50);

INSERT INTO UndergradPerson(person_ID, person_name, person_address, phone, email, student_ID, admission_date, major, minor, GPA)
VALUES ('S9953456H' , 'Liang Hu' , '321B Jln Besar' , '62959310' , 'liang4346@e.ntu.edu.sg', 'U1843638L', '2018-08-12', 'Aerospace Engineering', NULL, 2.98);
-------undergrad end------

-------grad stard------
INSERT INTO GradPerson(person_ID, person_name, person_address, phone, email, student_ID, admission_date, major, minor, grad_date)
VALUES ('S9534182H' ,  'Jiang Shao' , '133 New Bridge Road 12-07 Chinatown Point' , '6563335788' , 'jias0011@e.ntu.edu.sg', 'G1635252F', '2016-08-12', 'Computer Science', NULL, '2020-07-31');
-------grad end------


------prof start-------
INSERT INTO ProfessorPerson(person_ID, person_name, person_address, zip, city_name, state_name, phone, email, specialisation)
VALUES ('S6878903I','Xieren Wan' , '1002 Jalan Bukit Merah #02-01/03' , '159456', 'Singapore', 'Singapore', '6562708850' , 'xi3100an@e.ntu.edu.sg', 'Software Engineering');


INSERT INTO ProfessorPerson(person_ID, person_name, person_address, zip, city_name, state_name, phone, email, specialisation)
VALUES ('S7255001I','Guiying Pan' , '20 Upper Circular Road #03-06A The Riverwalk' ,  '058416', 'Singapore', 'Singapore', '6565133301' , 'gupa3001@e.ntu.edu.sg' , 'Material Engineering');

INSERT INTO ProfessorPerson(person_ID, person_name, person_address, zip, city_name, state_name, phone, email, specialisation)
VALUES('S6808102I', 'Bi Gong' , '101 Thomson Road #07-02 UNITED SQUARE' , '307591', 'Singapore', 'Singapore', '6562518211' , 'bi0088go@e.ntu.edu.sg', 'Biomedical Engineering');

INSERT INTO ProfessorPerson(person_ID, person_name, person_address, zip, city_name, state_name, phone, email, specialisation)
VALUES('S7253456H', 'ZhenKang  Pan' , '23 Defu Lane 12' , '539130', 'Singapore', 'Singapore', '6562518211' , 'pzk0098@e.ntu.edu.sg', 'Aerospace Engineering');

INSERT INTO ProfessorPerson(person_ID, person_name, person_address, zip, city_name, state_name, phone, email, specialisation)
VALUES('S7853464H' , 'He Hou' , '132 PANDAN LOOP BLK 9' , '128334', 'Singapore', 'Singapore', '67793338  ' , 'taihou@e.ntu.edu.sg', 'Electrical and Electrionic Engineering');

----------prof end-------

---------technical staff start------
INSERT INTO TechStaffPerson(person_ID, person_name, person_address, zip, city_name, state_name, phone, email, staff_ID, position, date_hired, specialisation, lab_name, school_name)
VALUES('S8945371A', 'Song Tian' , '110A Killiney Road TAI WAH BUILDING', '239549', 'Singapore', 'Singapore', '6562353660' , 'soti0051@e.ntu.edu.sg', 'X1334567B', 'Lab Assistant Manager', '2013-05-20', 'Electronic Engineering', 'Hardware Lab 1', 'School of Computer Science and Engineering');

INSERT INTO TechStaffPerson(person_ID, person_name, person_address, zip, city_name, state_name, phone, email, staff_ID, position, date_hired, specialisation, lab_name, school_name)
VALUES('S8525200Z', 'Fu Liao' , '317 outram road b1-23 holiday inn atrium' , '169075','Singapore', 'Singapore', '6563336754' , 'fuli0211@e.ntu.edu.sg', 'X1234567B', 'Lab Manager', '2012-10-01', 'Computer Engineering', 'Software Lab 3', 'School of Computer Science and Engineering');


INSERT INTO TechStaffPerson(person_ID, person_name, person_address, zip, city_name, state_name, phone, email, staff_ID, position, date_hired, specialisation, lab_name, school_name)
VALUES('S8809791A', 'Yi Xiao' , '1 Hougang Street 91 #01-41 HOUGANG FESTIVAL MARKET' , '538692', 'Singapore', 'Singapore', '6568811020' , 'yi0057xi@e.ntu.edu.sg','X1034567A', 'Lab Manager', '2010-08-02','Computer Engineering', 'Software Lab 1', 'School of Computer Science and Engineering');

INSERT INTO TechStaffPerson(person_ID, person_name, person_address, zip, city_name, state_name, phone, email, staff_ID, position, date_hired, specialisation, lab_name, school_name)
VALUES('S7185346H', 'Xinyi Pan' , '6 Tuas View Lane' , '637566', 'Singapore', 'Singapore', '68618025' , 'panjinlian@e.ntu.edu.sg', 'X1034747A', 'Lab Maintenance Staff', '2001-08-02','Aerospace Engineering', 'Aircraft Hangar', 'School of Physical and Mathematical Sciences');


INSERT INTO TechStaffPerson(person_ID, person_name, person_address, zip, city_name, state_name, phone, email, staff_ID, position, date_hired, specialisation, lab_name, school_name)
VALUES('S7985346H', 'Yahui Hao' , '7 Maxwell Rd #05-02A' , '069111', 'Singapore', 'Singapore', '62233768' , 'haoliyou@e.ntu.edu.sg', 'X1036677A', 'Lab manager', '2008-08-02','Aerospace Engineering', 'Biochemistry Laboratory 1', 'School of Chemical and Biomedical Engineering');

-----------technical staff end-------

---------admin staff start-------
INSERT INTO AdminStaffPerson(person_ID, person_name, person_address, zip, city_name, state_name, phone, email, staff_ID, position, date_hired, department)
VALUES('S8932771E',  'Jie Shen' , '620A, Lor 1 Toa Payoh' , '319762', 'Singapore', 'Singapore', '6568823000' , 'jish0082@e.ntu.edu.sg', 'X1234567D', 'Manager', '2012-07-01', 'Academic Office');

INSERT INTO AdminStaffPerson(person_ID, person_name, person_address, zip, city_name, state_name, phone, email, staff_ID, position, date_hired, department)
VALUES('S8548701A', 'Wen Hu' , '20 Ayer Rajah Crescent #04-04 TECHNOPRENEUR CENTRE' ,'139964', 'Singapore', 'Singapore', '6567799400' , 'wehu0032@e.ntu.edu.sg', 'X1834567F', 'Executive', '2018-01-10','Academic Office');

INSERT INTO AdminStaffPerson(person_ID, person_name, person_address, zip, city_name, state_name, phone, email, staff_ID, position, date_hired, department)
VALUES('S8778021Z', 'Yuhan Cai' , '445 Clementi Ave 3 #01-173' , '120445', 'Singapore', 'Singapore', '6567755182' , 'yuca0115@e.ntu.edu.sg', 'X1634567D', 'Senior Executive', '2016-04-06', 'Graduate Office');

INSERT INTO AdminStaffPerson(person_ID, person_name, person_address, zip, city_name, state_name, phone, email, staff_ID, position, date_hired, department)
VALUES('S7685666H', 'Bao Ma' , '#11-25, Maxwell House' , '069113', 'Singapore', 'Singapore', '63230936  ' , 'bmw@e.ntu.edu.sg', 'X1634767D', 'Senior Administrator', '2006-04-06', 'Chair Office');

INSERT INTO AdminStaffPerson(person_ID, person_name, person_address, zip, city_name, state_name, phone, email, staff_ID, position, date_hired, department)
VALUES('S6777666H', 'Zemin Xian' , '42A,Upper Dickson Road' , '207499', 'Singapore', 'Singapore', '96190505' , 'xianzem@e.ntu.edu.sg', 'X1633667D', 'Executive', '2005-04-06', 'Chair Office');



----------admin staff end--------

------pro has expertise start--------
INSERT INTO Prof_Has_Expertise(person_ID, field)
VALUES('S6878903I', 'Data Structure');
INSERT INTO Prof_Has_Expertise(person_ID, field)
VALUES('S7255001I', 'Semiconductor');
INSERT INTO Prof_Has_Expertise(person_ID, field)
VALUES('S6808102I', 'DNA');

INSERT INTO Prof_Has_Expertise(person_ID, field)
VALUES('S7853464H', 'Circuit');

INSERT INTO Prof_Has_Expertise(person_ID, field)
VALUES('S7255001I', 'Nuclear');
--------pro has expertise end-------------


--------peonsoninsch-------
INSERT INTO Person_In_School(person_ID, school_name)
VALUES('S9954754O' , 'School of Electrical and Electronic Engineering');

INSERT INTO Person_In_School(person_ID, school_name)
VALUES('S9953456H' , 'School of Mechanical and Aerospace Engineering');


INSERT INTO Person_In_School(person_ID, school_name)
VALUES('S7253456H' , 'School of Mechanical and Aerospace Engineering');


INSERT INTO Person_In_School(person_ID, school_name)
VALUES('S7853464H' , 'School of Electrical and Electronic Engineering');


INSERT INTO Person_In_School(person_ID, school_name)
VALUES('S7185346H', 'School of Physical and Mathematical Sciences');


INSERT INTO Person_In_School(person_ID, school_name)
VALUES('S7985346H', 'School of Chemical and Biomedical Engineering');
------personinsch end----


---------course taught start------
INSERT INTO Course_Taught(date_taught, student_person_ID, professor_person_ID, course_ID)
VALUES('2019-08-12', 'S9954754O', 'S7853464H', 'EE3010');

INSERT INTO Course_Taught(date_taught, student_person_ID, professor_person_ID, course_ID)
VALUES('2019-08-12', 'S9953456H', 'S7253456H', 'MA2701');
--------course taught end-------


----------lab experiment------
INSERT INTO Lab_Experiment(experiment_date, person_ID, Tlab_name, school_name, attendance)
VALUES('2019-10-21', 'S9954754O', 'Circuit Lab', 'School of Electrical and Electronic Engineering', '1');

INSERT INTO Lab_Experiment(experiment_date, person_ID, Tlab_name, school_name, attendance)
VALUES('2019-10-21', 'S9953456H', 'Aerospace Lab', 'School of Mechanical and Aerospace Engineering', '1');

INSERT INTO Laboratory(lab_name, school_name, location)
VALUES('Circuit Lab', 'School of Electrical and Electronic Engineering', 'S1-B1-04');


INSERT INTO Laboratory(lab_name, school_name, location)
VALUES('Aerospace Lab', 'School of Mechanical and Aerospace Engineering', 'NS1-B1-04');

SELECT * FROM Lab_Experiment;
SELECT * FROM Course_Taught