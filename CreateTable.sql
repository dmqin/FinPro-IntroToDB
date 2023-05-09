
 use FuniMaZion
 CREATE TABLE MsStaff(
		StaffID char(5) PRIMARY KEY CHECK (StaffID LIKE 'SF[0-9][0-9][0-9]' ),
		StaffName varchar(100) NOT NULL,
		StaffCityID CHAR(5) NOT NULL FOREIGN KEY REFERENCES MsCity(CityID) ON UPDATE CASCADE ON DELETE CASCADE,
		StaffGender varchar (10) NOT NULL CHECK (StaffGender IN ('Male','Female')),
		StaffDOB DATE NOT NULL CHECK (YEAR (StaffDOB) < 2000),
		StaffEmail varchar(100) CHECK (StaffEmail LIKE '%@gmail.com'), 
		StaffPassword varchar(50) CHECK (LEN(StaffPassword)>7)

 )

 CREATE TABLE MsCustomer (
		CustomerID char(5) PRIMARY KEY CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]'),
		CustomerName varchar(100) NOT NULL ,
		CustomerCityID CHAR(5) NOT NULL FOREIGN KEY REFERENCES MsCity(CityID) ON UPDATE CASCADE ON DELETE CASCADE,
		CustomerGender varchar (10) NOT NULL CHECK (CustomerGender IN ('Male','Female')),
		CustomerDOB DATE NOT NULL ,
		CustomerEmail varchar(100) CHECK (CustomerEmail LIKE '%@gmail.com'), 
		CustomerPassword varchar(50) CHECK (LEN(CustomerPassword)>7)

 )


 CREATE TABLE MsCity (
		CityID char(5) PRIMARY KEY CHECK (CityID LIKE 'CI[0-9][0-9][0-9]'),
		CityName varchar(20)
 
 
 )


 


 CREATE TABLE MsStudio(
		StudioID CHAR(5) PRIMARY KEY CHECK (StudioID LIKE 'SD[0-9][0-9][0-9]'),
		StudioName varchar (100) NOT NULL,
		StudioCityID CHAR(5) NOT NULL FOREIGN KEY REFERENCES MsCity(CityID) ON UPDATE CASCADE ON DELETE CASCADE,
 )


 CREATE TABLE MsAnimeGenre (
		GenreID CHAR (5) PRIMARY KEY CHECK (GenreID LIKE 'GE[0-9][0-9][0-9]'),
		GenreName varchar (20) NOT NULL
 
 )


SELECT * FROM MsAnime

CREATE TABLE MsAnime (
		AnimeID char(5) PRIMARY KEY CHECK (AnimeID LIKE 'AN[0-9][0-9][0-9]'),
		AnimeName varchar(100) NOT NULL,
		GenreID CHAR(5) NOT NULL FOREIGN KEY REFERENCES MsAnimeGenre(GenreID) ON UPDATE CASCADE ON DELETE CASCADE,
		AnimePrice float(10) NOT NULL, 
		AnimeDescription varchar(200) NOT NULL,
		MinimumAge int CHECK  (MinimumAge >= 0 AND MinimumAge <= 25) NOT NULL


)

SELECT * FROM MsAnime
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


