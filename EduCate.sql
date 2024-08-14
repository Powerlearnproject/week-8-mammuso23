CREATE TABLE Region (
    RegionID INT PRIMARY KEY,
    Name VARCHAR(100),
    UrbanRural VARCHAR(50)
);

CREATE TABLE School (
    SchoolID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(255),
    Type VARCHAR(50),
    TotalEnrollment INT,
    TotalTeachers INT,
    AvailableResources VARCHAR(255),
    InfrastructureQuality VARCHAR(255),
    RegionID INT,
    FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
);

SELECT 
    s.StudentID, 
    s.Name AS StudentName, 
    sc.Name AS SchoolName, 
    r.Name AS RegionName
FROM 
    Student s
JOIN 
    School sc ON s.SchoolID = sc.SchoolID
JOIN 
    Region r ON sc.RegionID = r.RegionID
WHERE 
    r.Name = 'Region Name';


CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    EnrollmentDate DATE,
    GradeLevel VARCHAR(50),
    SocioeconomicStatus VARCHAR(50),
    DisabilityStatus VARCHAR(50),
    DropoutDate DATE,
    SchoolID INT,
    FOREIGN KEY (SchoolID) REFERENCES School(SchoolID)
);

CREATE TABLE Teacher (
    TeacherID INT PRIMARY KEY,
    Name VARCHAR(100),
    Qualification VARCHAR(100),
    YearsOfExperience INT,
    SubjectSpecialization VARCHAR(100),
    EmploymentStatus VARCHAR(50),
    SchoolID INT,
    FOREIGN KEY (SchoolID) REFERENCES School(SchoolID)
);

CREATE TABLE Classroom (
    ClassroomID INT PRIMARY KEY,
    Capacity INT,
    GradeLevel VARCHAR(50),
    SchoolID INT,
    FOREIGN KEY (SchoolID) REFERENCES School(SchoolID)
);

CREATE TABLE EducationalResource (
    ResourceID INT PRIMARY KEY,
    ResourceType VARCHAR(50),
    AvailabilityStatus VARCHAR(50),
    SchoolID INT,
    FOREIGN KEY (SchoolID) REFERENCES School(SchoolID)
);



