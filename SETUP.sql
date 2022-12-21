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
)