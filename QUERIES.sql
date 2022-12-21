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
