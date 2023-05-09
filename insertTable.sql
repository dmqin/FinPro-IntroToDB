 SELECT * FROM MsCity
 INSERT INTO MsCity VALUES 
 ('CI001','Jakarta'),('CI002','Tokyo'),('CI003','Dubai'),('CI004','London'), ('CI005','Barcelona'), ('CI006','Cairo'),
 ('CI007','Rio De Janiero'),('CI008','New York'),('CI009','New Delhi'),('CI010','Cape Town'),('CI011','Kyiv'),('CI012','Toronto')



  SELECT * FROM MsStaff
 INSERT INTO MsStaff VALUES  
 ('SF001','Donald Trump','CI008','Male','1999-12-19','trumpiess200@gmail.com','donaldDuck123'),
 ('SF002','Bambang Pamungkas','CI001','Male','1985-01-12','bambanganteng@gmail.com','bepe1985'),
 ('SF003','Ben White','CI004','Male','1992-08-01','itsbenziee@gmail.com','IAmWhiteYeah'), 
 ('SF004','Kym Ladell','CI012','Female','1982-05-21','ladellkym@gmail.com','kymieel201'),
 ('SF005','Bruno Gumaires','CI007','Male','1992-02-27','brunoGum@gmail.com','gumairezzz'),
 ('SF006','Takehiro Tomiyasu','CI002','Male','1995-08-04','iamTomyyy@gmail.com','tomiyasuu95'),
 ('SF007','Mahmoud Aboubakar','CI006','Male','1975-05-12','aboubakarrmahmoud@gmail.com','mahm0udAbu'),
 ('SF008','Siphiwe Tshabalala','CI010','Male','1978-12-12','tshabalalalalala@gmail.com','shipiweTshh78'),
 ('SF009','Alesha Lehmann','CI004','Female','1998-10-22','alesha2210@gmail.com','1ehnm4nn1998'),
 ('SF010','Ladoo Singh','CI009','Male','1979-12-14','singh200@gmail.com','ladoosinghthepolice'),
 ('SF011','Hakim Ziyech','CI003','Male','1990-03-15','syechziyech@gmail.com','ziyechTheBaller')


  SELECT * FROM MsCustomer
  
 --('CI001','Jakarta'),('CI002','Tokyo'),('CI003','Dubai'),('CI004','London'), ('CI005','Barcelona'), ('CI006','Cairo'),
 --('CI007','Rio De Janiero'),('CI008','New York'),('CI009','New Delhi'),('CI010','Cape Town'),('CI011','Kyiv'),('CI012','Toronto')

 INSERT INTO MsCustomer VALUES  
 ('CU001','Jack Wilshere','CI004','Male','1979-10-04','ItsJackieee@gmail.com','wilshareHasRetired'),
 ('CU002','Xavi Hernandez','CI005','Male','1977-03-15','XvieeeNandez@gmail.com','xavier1977'),
 ('CU003','Ratu Tisha','CI001','Female','1990-02-09','queentisha@gmail.com','Tishaaa1990'),
 ('CU004','Kaorou Mitoma','CI002','Male','1998-05-02','kaorou0298@gmail.com','m1t0m4koru'),
 ('CU005','Lauren Sinclair','CI012','Female','1991-12-17','laurenn1712@gmail.com','sinclair1719'),
 ('CU006','Belladonna Davenport','CI005','Female','1989-02-24','donnadavenport@gmail.com','amigobella24'),
 ('CU007','Neyra Darcy','CI010','Female','1987-09-03','neyneyra@gmail.com','n3yr4D4rcy'),
 ('CU008','Youssef En-Neysri','CI003','Male','1982-12-21','neysriii@gmail.com','yousneysri1982'),
 ('CU009','Roberto Carlos','CI007','Male','1976-02-03','carlosroberto@gmail.com','curveball99'),
 ('CU010','Oleksandr Zinchenko','CI011','Male','2001-12-05','oleksandr199@gmail.com','IamZinii'),
 ('CU011','Patrick Bamford','CI004','Male','1978-10-10','patrickbam@gmail.com','B4mforB00m'),
 ('CU012','Ryan Flemmings','CI008','Male','1994-04-21','flemmings94@gmail.com','Flam331nGs'),
 ('CU013','Rayyan Karim','CI003','Male','2004-10-04','RayyanGanteng@gmail.com','losGalacticos12'),
 ('CU014','Elon Musk','CI010','Male','1978-08-04','elontesla@gmail.com','XÆAE-12sr-71')

 
INSERT INTO MsAnimeGenre VALUES ('GE001','Drama'),('GE002','Fantasy'),('GE003','Romance'),('GE004','Psychologycal'),('GE005','Sports'),
								('GE006','Adventure'),('GE007','Action'),('GE008','Comedy'),('GE009','Horror'),('GE010','Mystery')


INSERT INTO MsAnime VALUES ('AN001','Naruto Shipudden','GE007',52.5,'The story about a young ninja named Naruto who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village.', 10) ,
                            ('AN002','HunterXHunter','GE006',82.75,'Gon is a kid who want to become a hunter. To achieve that goal he has to completing some challange to get the certified Hunter license. The adventure start from here!', 5),
							 ('AN003','Sinchan','GE008',7.2,'Funny kid', 2) ,
							  ('AN004','Purple Hyacinth','GE010',105.37,'An Detetctive that worked as ann officer who can detect a lie that team up with a deadly asassin who known as Purple Hyacinth', 18) ,
							   ('AN005','Kuroko No Basket','GE005',27.5,'Basketball', 10),
							    ('AN006','Titanic','GE003',18.20,'A love story that ended up in the pacific ocean', 18),
							     ('AN007','The Wizard of Oz','GE002',45,'All around you is just a fantasy !', 12),
							      ('AN008','Ghost Busters','GE009',31.2,'3 college students that also worked as a ghost hunter in the midnight', 17),
								   ('AN009','SpyXFamily','GE004',97,'Twilight is tasked with spying on  leader of the National Unity Party within Ostania by enroll a child in the same private school and pose as a fellow parent.', 10),
								    ('AN010','Neigbours','GE001',47.5,'2 Family who live in next door that always make some conflicts. However, they are a kind to each other. Are they?', 10)
