
 CREATE DATABASE FuniMaZion
 use FuniMaZion

  CREATE TABLE MsCity (
		CityID char(5) PRIMARY KEY CHECK (CityID LIKE 'CI[0-9][0-9][0-9]'),
		CityName varchar(20)
 )

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



 CREATE TABLE MsStudio(
		StudioID CHAR(5) PRIMARY KEY CHECK (StudioID LIKE 'SD[0-9][0-9][0-9]'),
		StudioName varchar (100) NOT NULL,
		StudioCityID CHAR(5) NOT NULL FOREIGN KEY REFERENCES MsCity(CityID) ON UPDATE CASCADE ON DELETE CASCADE,
 )


 CREATE TABLE MsAnimeGenre (
		GenreID CHAR (5) PRIMARY KEY CHECK (GenreID LIKE 'GE[0-9][0-9][0-9]'),
		GenreName varchar (20) NOT NULL
 
 )




CREATE TABLE MsAnime (
		AnimeID char(5) PRIMARY KEY CHECK (AnimeID LIKE 'AN[0-9][0-9][0-9]'),
		AnimeName varchar(100) NOT NULL,
		GenreID CHAR(5) NOT NULL FOREIGN KEY REFERENCES MsAnimeGenre(GenreID) ON UPDATE CASCADE ON DELETE CASCADE,
		AnimePrice float(10) NOT NULL, 
		AnimeDescription varchar(200) NOT NULL,
		MinimumAge int CHECK  (MinimumAge >= 0 AND MinimumAge <= 25) NOT NULL
		)

CREATE TABLE PurchaseHeader (
		PurchaseID CHAR(5) PRIMARY KEY CHECK (PurchaseID LIKE 'PU[0-9][0-9][0-9]'),
		
		StaffId CHAR (5) FOREIGN KEY REFERENCES MsStaff(StaffID),
		StudioID CHAR (5) FOREIGN KEY REFERENCES MsStudio (StudioID),
		PurchaseDate DATE NOT NULL
		
	

)


CREATE TABLE PurchaseDetail(
	PurchaseID CHAR(5)  FOREIGN KEY REFERENCES PurchaseHeader(PurchaseID),
	AnimeID CHAR(5) FOREIGN KEY REFERENCES MsAnime(AnimeID)
)


CREATE TABLE SalesHeader(

	SalesID CHAR(5)PRIMARY KEY CHECK (SalesID LIKE 'SA[0-9][0-9][0-9]'),
	CustomerID CHAR (5) FOREIGN KEY REFERENCES MsCustomer(CustomerID),
	SalesDate DATE NOT NULL,
	SalesMethod VARCHAR(6) CHECK (SalesMethod IN ('Credit', 'Debit')) NOT NULL
	
	
	)


CREATE TABLE SalesDetail(

SalesID CHAR(5) FOREIGN KEY REFERENCES SalesHeader(SalesID),
AnimeID CHAR(5) FOREIGN KEY REFERENCES MsAnime(AnimeID),
Duration INT NOT NULL
)

BEGIN TRAN
ROLLBACK

