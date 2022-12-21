CREATE TYPE Genders AS ENUM ('MUŠKI', 'ŽENSKI', 'NEPOZNATO', 'OSTALO');
CREATE TYPE Fields AS ENUM ('programer', 'fizičar', 'inženjer', 'znanstvenik materijala');

CREATE TABLE Accelerators(
    AcceleratorId SERIAL PRIMARY KEY,
    AcceleratorName VARCHAR(60) NOT NULL
);

CREATE TABLE Projects(
    ProjectId SERIAL PRIMARY KEY,
    ProjectName VARCHAR NOT NULL
);

CREATE TABLE AcceleratorsProjects(
    APid SERIAL PRIMARY KEY,
    AcceleratorId INT REFERENCES Accelerators(AcceleratorId)  ON DELETE CASCADE,
    ProjectId INT NOT NULl REFERENCES Projects(ProjectId)  ON DELETE CASCADE
);

CREATE TABLE Papers( --scientific papers
    PaperId SERIAL PRIMARY KEY,
    ProjectId INT NOT NULL REFERENCES Projects(ProjectId)  ON DELETE CASCADE,
    PaperName VARCHAR(20) NOT NULL,
    NumOfQuotes INT DEFAULT 0,
    PublishDate TIMESTAMP DEFAULT now()
);

CREATE TABLE Countries(
    CountryId SERIAL PRIMARY KEY,
    CountryName VARCHAR(30) NOT NULL UNIQUE,
    CountryPopulation INT NOT NULL,
    CountryPPP DECIMAL NOT NULL
);

CREATE TABLE Cities(
    CityId SERIAL PRIMARY KEY,
    CityName VARCHAR(20) NOT NULL,
    CountryId INT NOT NULL REFERENCES Countries(CountryId)  ON DELETE CASCADE
);

CREATE TABLE Hotels(
    HotelId SERIAL PRIMARY KEY,
    HotelName VARCHAR(30) NOT NULL,
    CityId INT NOT NULL REFERENCES Cities(CityId)  ON DELETE CASCADE,
    Capacity INT NOT NULL CHECK (capacity > 0)
);

CREATE TABLE Scientists(
    ScientistId SERIAL PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    BirthDate DATE NOT NULL,
    CountryId INT NOT NULL REFERENCES Countries(CountryId)  ON DELETE CASCADE,
    Gender GENDERS NOT NULL,
    Field FIELDS NOT NULL,
    HotelId INT NOT NULL REFERENCES Hotels(HotelId)
);

CREATE TABLE PapersScientists(
    PaperId INT NOT NULL REFERENCES Papers(PaperId) ON DELETE CASCADE,
    ScientistId INT NOT NULL REFERENCES Scientists(ScientistId) ON DELETE CASCADE,
    PRIMARY KEY(PaperId, ScientistId)
);

ALTER TABLE AcceleratorsProjects
ADD CONSTRAINT UniqueAcceleratorProject UNIQUE(AcceleratorId, ProjectId);

/*seed*/
INSERT INTO Countries (CountryName, CountryPopulation, CountryPPP) VALUES
('Kina', '1439323776', '16842'),
('Indija', '1380004385', '7166'),
('SAD', '331002651', '59928'),
('Brazil', '212559417', '15553'),
('Japan', '126476461', '42067');

INSERT INTO Cities (CityName, CountryId) VALUES
('Hong Kong', (SELECT CountryId FROM Countries c WHERE (c.CountryName='Kina'))),
('New York', (SELECT CountryId FROM Countries c WHERE (c.CountryName='SAD'))),
('Brasilia', (SELECT CountryId FROM Countries c WHERE (c.CountryName='Brazil'))),
('Tokyo', (SELECT CountryId FROM Countries c WHERE (c.CountryName='Japan'))),
('Osaka', (SELECT CountryId FROM Countries c WHERE (c.CountryName='Japan')));

INSERT INTO Hotels (HotelName, CityId, Capacity) VALUES
('Japan Hotel 1', (SELECT CityId FROM Cities c WHERE (c.CityName='Tokyo')), 3),
('Japan Hotel 2', (SELECT CityId FROM Cities c WHERE (c.CityName='Osaka')), 2),
('Brasil Hotel', (SELECT CityId FROM Cities c WHERE (c.CityName='Brasilia')), 4),
('NYC Hotel', (SELECT CityId FROM Cities c WHERE (c.CityName='New York')), 7),
('Hotel China', (SELECT CityId FROM Cities c WHERE (c.CityName='Hong Kong')), 5);

INSERT INTO Scientists (FirstName, LastName, BirthDate, CountryId, Gender, Field, HotelId) VALUES
('Bruno', 'Brunić', '2003-03-03', (SELECT CountryId FROM Countries c WHERE (c.CountryName='Japan')), 'MUŠKI', 'fizičar', (SELECT HotelId FROM Hotels h WHERE (h.HotelName='Brasil Hotel'))),
('Duje', 'Dujić', '2007-07-07', (SELECT CountryId FROM Countries c WHERE (c.CountryName='SAD')), 'OSTALO', 'inženjer', (SELECT HotelId FROM Hotels h WHERE (h.HotelName='Hotel China'))),
('Petar', 'Petrić', '2005-05-05', (SELECT CountryId FROM Countries c WHERE (c.CountryName='Indija')), 'NEPOZNATO', 'znanstvenik materijala', (SELECT HotelId FROM Hotels h WHERE (h.HotelName='Japan Hotel 2'))),
('Ana', 'Anić', '2002-02-02', (SELECT CountryId FROM Countries c WHERE (c.CountryName='Kina')), 'ŽENSKI', 'programer', (SELECT HotelId FROM Hotels h WHERE (h.HotelName='NYC Hotel')));

INSERT INTO Accelerators (AcceleratorName) VALUES
('AcceleratorA'),
('AcceleratorB'),
('AcceleratorC'),
('AcceleratorD'),
('AcceleratorE');

INSERT INTO Projects (ProjectName) VALUES
('ProjectA'),
('ProjectB'),
('ProjectC'),
('ProjectD'),
('ProjectE');

INSERT INTO AcceleratorsProjects (AcceleratorId, ProjectId) VALUES
((SELECT AcceleratorId FROM Accelerators a WHERE (a.AcceleratorName='AcceleratorA')), (SELECT ProjectId FROM Projects a WHERE (a.ProjectName='ProjectA'))),
((SELECT AcceleratorId FROM Accelerators a WHERE (a.AcceleratorName='AcceleratorA')), (SELECT ProjectId FROM Projects a WHERE (a.ProjectName='ProjectB'))),
((SELECT AcceleratorId FROM Accelerators a WHERE (a.AcceleratorName='AcceleratorC')), (SELECT ProjectId FROM Projects a WHERE (a.ProjectName='ProjectC'))),
((SELECT AcceleratorId FROM Accelerators a WHERE (a.AcceleratorName='AcceleratorD')), (SELECT ProjectId FROM Projects a WHERE (a.ProjectName='ProjectE'))),
((SELECT AcceleratorId FROM Accelerators a WHERE (a.AcceleratorName='AcceleratorE')), (SELECT ProjectId FROM Projects a WHERE (a.ProjectName='ProjectD')));

INSERT INTO Papers (ProjectId, PaperName, NumOfQuotes, PublishDate) VALUES
((SELECT ProjectId FROM Projects a WHERE (a.ProjectName='ProjectB')), 'PaperB1', '2', '2021-02-02'),
((SELECT ProjectId FROM Projects a WHERE (a.ProjectName='ProjectB')), 'PaperB2', '5', '2019-02-02'),
((SELECT ProjectId FROM Projects a WHERE (a.ProjectName='ProjectC')), 'PaperC1', '7', '2018-02-02'),
((SELECT ProjectId FROM Projects a WHERE (a.ProjectName='ProjectC')), 'PaperC1', '3', '2017-02-02'),
((SELECT ProjectId FROM Projects a WHERE (a.ProjectName='ProjectD')), 'PaperD1', '4', '2016-02-02'),
((SELECT ProjectId FROM Projects a WHERE (a.ProjectName='ProjectE')), 'PaperE1', '9', '2015-02-02'),
((SELECT ProjectId FROM Projects a WHERE (a.ProjectName='ProjectA')), 'PaperA1', '8', '2022-02-02');

INSERT INTO PapersScientists (PaperId, ScientistId) VALUES
((SELECT PaperId FROM Papers p WHERE (p.PaperName='PaperB1')), (SELECT ScientistId FROM Scientists a WHERE (a.FirstName='Duje' AND a.LastName='Dujić'))),
((SELECT PaperId FROM Papers p WHERE (p.PaperName='PaperB1')), (SELECT ScientistId FROM Scientists a WHERE (a.FirstName='Bruno' AND a.LastName='Brunić'))),
((SELECT PaperId FROM Papers p WHERE (p.PaperName='PaperE1')), (SELECT ScientistId FROM Scientists a WHERE (a.FirstName='Bruno' AND a.LastName='Brunić'))),
((SELECT PaperId FROM Papers p WHERE (p.PaperName='PaperC1')), (SELECT ScientistId FROM Scientists a WHERE (a.FirstName='Petar' AND a.LastName='Petrić'))),
((SELECT PaperId FROM Papers p WHERE (p.PaperName='PaperB1')), (SELECT ScientistId FROM Scientists a WHERE (a.FirstName='Ana' AND a.LastName='Anić')));