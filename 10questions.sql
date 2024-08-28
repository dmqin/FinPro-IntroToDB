
--1.

SELECT StudioName,COUNT (DISTINCT StaffID) AS StaffCount
FROM MsStudio
JOIN MsCity
ON MsStudio.StudioCityID=MsCity.CityID
Join MsStaff
ON MsCity.CityID=MsStaff.StaffCityID
WHERE MsCity.CityID=MsStaff.StaffCityID 
AND YEAR(StaffDOB)>1990
OR LEN(StaffPassword)<8
GROUP BY MsStudio.StudioName

--2 NO DATA


SELECT CustomerName, COUNT (sd.AnimeID) AS AnimeNotFulflledAgeCriteria
FROM SalesHeader sh
JOIN SalesDetail sd ON SD.SalesID=sh.SalesID
JOIN MsAnime a ON  sd.SalesID=a.AnimeID
JOIN MsCustomer c ON c.CustomerID=sh.CustomerID
WHERE  CONVERT(DATE, GETDATE()) = '2022-01-01'
AND c.CustomerDOB > DATEADD(YEAR, a.MinimumAge, CONVERT(DATE, GETDATE()))
AND sd.Duration BETWEEN 10 AND 20
GROUP BY CustomerName

-- 3 NO DATA
SELECT 
  StudioName,
  MIN(MinimumAge) AS AnimeMinimumAge,
  MAX(MinimumAge) AS AnimeMaximumAge,
  CONCAT(YEAR(PurchaseDate), '-', DATEPART(QUARTER, PurchaseDate)) AS LatestPurchaseDateQuarter
FROM
  MsStudio MS JOIN PurchaseHeader PH ON MS.StudioID=PH.StudioID
  JOIN PurchaseDetail PD ON PH.PurchaseID=PD.PurchaseID JOIN MsAnime MA ON PD.AnimeID=MA.AnimeID
WHERE
  StudioName LIKE '% % %' AND LEN(AnimeDescription) < 10
GROUP BY
  StudioName,PurchaseDate


--4 NO DATA
SELECT UPPER (MsAnimeGenre.GenreName) AS GenreName, COUNT (SalesHeader.SalesID) AS SaleCount , SUM (Duration) AS SaleDurationSum
FROM SalesDetail
JOIN SalesHeader ON SalesHeader.SalesID= SalesDetail.SalesID
JOIN MsAnime ON MsAnime.AnimeID=SalesDetail.AnimeID
JOIN MsAnimeGenre ON MsAnimeGenre.GenreID=MsAnime.GenreID
WHERE LEN(MsAnime.AnimeDescription) - LEN(REPLACE(MsAnime.AnimeDescription, ' ', '')) + 1 <4

GROUP BY SalesDetail.Duration, MsAnimeGenre.GenreName 

HAVING COUNT (SalesHeader.SalesID) > 5

-- 5
SELECT LOWER(c.CustomerName) AS CustomerName,
       UPPER(a.AnimeName) AS AnimeName,
       AVG(a.AnimePrice * sd.Duration) AS AverageSpend
FROM MsCustomer c
JOIN SalesHeader sh ON c.CustomerID = sh.CustomerID
JOIN SalesDetail sd ON sh.SalesID = sd.SalesID
JOIN MsAnime a ON sd.AnimeID = a.AnimeID
WHERE LOWER(SUBSTRING(c.CustomerName, 1, 1)) IN ('a', 'e', 'i', 'o', 'u') OR
      UPPER(SUBSTRING(c.CustomerName, 1, 1)) IN ('A', 'E', 'I', 'O', 'U')
GROUP BY c.CustomerID, LOWER(c.CustomerName), UPPER(a.AnimeName)
HAVING AVG(a.AnimePrice * sd.Duration) > (
    SELECT AVG(AnimePrice * Duration)
    FROM SalesDetail
    JOIN MsAnime ON SalesDetail.AnimeID = MsAnime.AnimeID
)

-- 6 NO DATA
SELECT MC.CustomerName,
  CONCAT('Sales-', SUBSTRING(SH.SalesID, 3, LEN(SH.SalesID))) AS SalesId,
  DATEPART(dy, SH.SalesDate) AS SalesDayOfYear
FROM
  MsCustomer MC
  JOIN SalesHeader SH ON MC.CustomerID = SH.CustomerID
  JOIN SalesDetail SD ON SH.SalesID = SD.SalesID
  JOIN MsAnime MA ON SD.AnimeID = MA.AnimeID
WHERE
  MONTH(SH.SalesDate) IN (3, 5, 7)
  AND AnimePrice = (
    SELECT MIN(AnimePrice) FROM MsAnime AS Alias
  )


--7 NO DATA


SELECT CustomerName, FORMAT (CustomerDOB,'dddd dd-MMMM-yy')AS CustomerDOB, CONCAT( SUM(sd.Duration * a.AnimePrice), ' rupiah') AS TotalSpending
FROM MsCustomer c
JOIN SalesHeader sh ON sh.CustomerID=c.CustomerID
JOIN SalesDetail sd ON sd.SalesID=sh.SalesID
JOIN MsAnime a ON a.AnimeID= sd.AnimeID
JOIN MsAnimeGenre ge ON ge.GenreID=a.GenreID

WHERE DAY(c.CustomerDOB )<= 15
AND MONTH(c.CustomerDOB ) IN ('1','2','3','4','5','6') 

GROUP BY c.CustomerName, c.CustomerDOB

HAVING COUNT(DISTINCT a.GenreID) = (
SELECT MAX(GenreCount)
FROM
    (
     SELECT COUNT(DISTINCT ge.GenreID) AS GenreCount
     FROM MsAnimeGenre ge
    ) AS genresubs
)


-- 8	

SELECT StaffName, REPLACE (s.StaffID,'SF','Staff ') AS StaffID, REVERSE (StaffPassword) AS StaffPassword, 
MAX(ph.PurchaseDate) AS LatestPurchaseYear
FROM MsStaff s
JOIN PurchaseHeader ph ON s.StaffID=ph.StaffId

GROUP BY StaffName,s.StaffID,s.StaffPassword
HAVING COUNT(DISTINCT ph.StudioID) = (
    SELECT MAX(StudioCount)
    FROM (
        SELECT COUNT(DISTINCT ph.StudioID) AS StudioCount
        FROM PurchaseHeader ph
		JOIN MsStudio st ON st.StudioID=ph.StudioId
		WHERE st.StudioName NOT LIKE '%[^a-zA-Z0-9 ]%'
        GROUP BY ph.StaffID
    ) AS Subquery
)

-- 9 NO DATA
CREATE VIEW CustomerData AS
SELECT c.CustomerName, LEFT(c.CustomerEmail, CHARINDEX('@', c.CustomerEmail) - 1) AS CustomerEmailName
FROM MsCustomer c
WHERE c.CustomerID IN (
    SELECT sh.CustomerID
    FROM SalesHeader sh
    INNER JOIN SalesDetail sd ON sh.SalesID = sd.SalesID
    GROUP BY sh.CustomerID
    HAVING AVG(sd.Duration) > 10
) AND c.CustomerID NOT IN (
    SELECT sh.CustomerID
    FROM SalesHeader sh
    INNER JOIN SalesDetail sd ON sh.SalesID = sd.SalesID
    INNER JOIN MsAnime a ON sd.AnimeID = a.AnimeID
    INNER JOIN MsAnimeGenre a2 ON a.GenreID = a2.GenreID
    WHERE sd.AnimeID = a.AnimeID AND a.GenreID = a2.GenreID
);

--10

 CREATE VIEW AnimesCustomerMayWatch AS
 SELECT CustomerName,  COUNT(MA.AnimeID) AS CouldWatchAnimeCount ,CONCAT(AVG(AnimePrice),' Rupiah')AS AveragePrice
 FROM MsCustomer MC JOIN SalesHeader SH ON MC.CustomerID=SH.CustomerID 
 JOIN SalesDetail SD ON SH.SalesID=SD.SalesID JOIN MsAnime MA
 ON SD.AnimeID=MA.AnimeID WHERE MinimumAge <= DATEDIFF(YEAR, CustomerDOB,'2021-07-08') AND   MA.AnimePrice < 18000
GROUP BY
    MC.CustomerName