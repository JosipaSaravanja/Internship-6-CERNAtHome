/*1. Naziv i datum objave svakog znanstvenog rada zajedno s imenima znanstvenika koji su na njemu radili, pri čemu imena znanstvenika moraju biti u jednoj ćeliji i u obliku Prezime, I.; npr. Puljak, I.; Godinović, N.; Bilušić, A.*/

SELECT 
p.PaperName, 
p.PublishDate, 
(SELECT STRING_AGG(CONCAT(s.LastName, ' ', SUBSTRING(s.FirstName, 1, 1), '.'), ', ') FROM Scientists s 
 WHERE(ps.ScientistId = s.ScientistId)) AS Scientists 
FROM PapersScientists ps
JOIN Papers p ON ps.PaperId = p.PaperId;

/*2. Ime, prezime, spol (ispisati ‘MUŠKI’, ‘ŽENSKI’, ‘NEPOZNATO’, 
‘OSTALO’;), ime države i  PPP/capita iste svakom znanstveniku*/

SELECT 
s.FirstName,
s.LastName,
s.Gender,
c.CountryName,
c.CountryPPP
FROM Scientists s
JOIN Countries c ON c.CountryId = s.CountryId;

/*3. svaku kombinaciju projekta i akceleratora, pri čemu nas zanimaju samo nazivi; u slučaju 
da projekt nije vezan ni za jedan akcelerator, svejedno ga ispiši uz ime akceleratora ‘NEMA GA’.*/

SELECT
a.AcceleratorName,
COALESCE(p.ProjectName, 'Nema ga')
FROM AcceleratorsProjects ap
JOIN Accelerators a ON a.AcceleratorId=ap.AcceleratorId
JOIN Projects p ON p.ProjectId=ap.ProjectId;

/*4. Sve projekte kojima je bar jedan od radova izašao između 2015. i 2017.*/

SELECT pr.ProjectName FROM Projects pr
JOIN Papers pa ON pa.ProjectId=pr.ProjectId 
WHERE (DATE_PART('year', pa.PublishDate) BETWEEN 2015 AND 2017);

/*5. U istoj tablici po zemlji broj radova i najpopularniji rad znanstvenika 
iste zemlje, pri čemu je najpopularniji rad onaj koji ima najviše citata*/

SELECT c.CountryName,
(COUNT(p.PaperId))
FROM Countries c
JOIN Scientists s ON s.CountryId=c.CountryId
JOIN PapersScientists ps ON ps.ScientistId=s.ScientistId
JOIN Papers p ON p.PaperId=ps.PaperId
GROUP BY c.CountryName;

/*6. prvi objavljeni rad po svakoj zemlji*/

SELECT c.CountryName, 
MIN(p.PublishDate),
(SELECT pa.PaperName FROM Papers pa WHERE (pa.PublishDate = MIN(p.PublishDate)))
FROM Countries c
JOIN Scientists s ON s.CountryId =c.CountryId
Join PapersScientists ps ON ps.ScientistId=s.ScientistId
JOIN Papers p ON p.PaperId=ps.PaperId
GROUP BY c.CountryId;

/*7. gradove po broju znanstvenika koji trenutno u njemu borave*/

SELECT c.CityName FROM Cities c 
JOIN Hotels h ON h.CityId=h.CityId
JOIN Scientists s ON s.HotelId = h.HotelId
GROUP BY c.CityName
ORDER BY Count(s.ScientistId);

/*8. prosječan broj citata radova po svakom akceleratoru*/

SELECT a.AcceleratorName, ROUND(p.NumOfQuotes, 2) as averagenumberofquotes  FROM Accelerators a
JOIN AcceleratorsProjects ap ON ap.AcceleratorId=a.AcceleratorId
JOIN Projects pr ON pr.ProjectId=ap.ProjectId
JOIN Papers p ON p.ProjectId=pr.ProjectId
GROUP BY a.AcceleratorName, p.NumOfQuotes;


/*9. broj znanstvenika po struci, desetljeću rođenja i spolu; u slučaju da je broj znanstvenika 
manji od 20, ne prikazuj kategoriju; poredaj prikaz po desetljeću rođenja*/

SELECT s.Field, DATE_PART('decade', (s.BirthDate)) as decade, s.Gender FROM Scientists s
GROUP BY s.Field, decade, s.Gender
HAVING COUNT(s.ScientistId) >=20
ORDER BY decade DESC;

/*BONUS 1. prikaži 10 najbogatijih znanstvenika, ako po svakom radu dobije brojCitatabrojZnanstvenikaPoRadu €*/

SELECT s.FirstName, s.LastName FROM Scientists s
JOIN PapersScientists ps ON ps.ScientistId=s.ScientistId

