CREATE DATABASE course_work3

USE  course_work3

-- Question 03 --

CREATE TABLE Employee
(
Id				INT,
Name			VARCHAR(50),
Manager_id		INT
)


INSERT INTO [dbo].Employee (
	[Id], [Name], [Manager_id])
VALUES (1, 'Silva', NULL),
(2, 'Perera', 1),
(3, 'Sandun', 1),
(4, 'Mathan', 2),
(5, 'Abdul', 2),
(6, 'Mihindu', 3)

SELECT * FROM Employee

SELECT a.Name as Employee_Name, b.Name as Manager_Name 
FROM dbo.Employee a
INNER JOIN dbo.Employee b
ON a.id = b.manager_id

GO


