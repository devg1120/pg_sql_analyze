/*

https://sql55.com/t-sql/t-sql-sample-1.php

*/


  DROP TABLE dbo.TestResultSummary;

  DROP TABLE dbo.TestResult; 

  DROP TABLE dbo.Test; 

  DROP TABLE dbo.StudentGPA;
    
  DROP TABLE dbo.Student; 

-----------------------------------------------

CREATE TABLE Student (
   --StudentID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
   StudentID INT NOT NULL PRIMARY KEY,
   FirstName VARCHAR(50) NULL,
   LastName VARCHAR(50) NULL,
   Birthday DATE NULL,
   Gender CHAR(1) NULL
);

INSERT INTO Student
  (FirstName, LastName, Birthday, Gender)
 VALUES
  ('Taro', 'Yamada', '1980-02-15', 'M'),
  ('Hanako', 'Tanaka' ,'1979-12-30', 'F'),
  ('Yuko', 'Suzuki', '1979-07-07', 'F'),
  ('Takao', 'Sato', '1980-03-12', 'M'),
  ('Hiroki', 'Takagi', '1979-04-05', 'M'),
  ('Yuka', 'Kimura', '1981-03-27', 'F');

-----------------------------------------------

CREATE TABLE Test (
    --TestID      INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    TestID      INT NOT NULL  PRIMARY KEY,
    --TestNameEn  NVARCHAR(50) NOT NULL,
    --TestNameJp  NVARCHAR(50) NOT NULL,
    TestNameEn  VARCHAR(50) NOT NULL,
    TestNameJp  VARCHAR(50) NOT NULL
);

INSERT INTO Test 
    ( TestNameEn, TestNameJp )
VALUES  
    ('Math 1', '数学１'),
    ('English 1', '英語１'),
    ('History 1', '歴史１');

-----------------------------------------------

CREATE TABLE TestResult (
    --TestResultID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    TestResultID INT NOT NULL  PRIMARY KEY,
    TestID INT NULL REFERENCES Test (TestID),
    StudentID INT NULL REFERENCES Student (StudentID), 
    Score INT NULL
);

INSERT INTO TestResult
    ( TestID, StudentID, Score )
VALUES
    ( 1, 1, 85),
    ( 1, 2, 60),
    ( 1, 4, 98),
    ( 1, 5, 73),
    ( 2, 1, 77),
    ( 2, NULL, NULL),
    ( 2, 3, 92),
    ( 2, 4, 81);

-----------------------------------------------

CREATE TABLE TestResultSummary (
    TestResultSummaryID INT NOT NULL  PRIMARY KEY,
    TestID INT NULL REFERENCES Test (TestID),
    MinScore DECIMAL(3,0) NULL,
    MaxScore decimal(3,0) NULL,
    AvgScore DECIMAL(5,2) NULL
);

