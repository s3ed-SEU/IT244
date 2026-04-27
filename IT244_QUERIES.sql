
-- Query 1: List all researchers specializing in Computer Science and display their details
SELECT R.*
FROM Researcher R
JOIN Researcher_Specialization RS ON R.Researcher_ID = RS.Researcher_ID
WHERE RS.Specialization = 'Computer Science';
 
-- Query 2: List all research centers established after 2020 and display their details
SELECT *
FROM Research_Center
WHERE YEAR(Establishment_Date) > 2020;
 
-- Query 3: List Project_ID, project title, project domain, and full names of researchers for Active projects
SELECT P.Project_ID, P.Project_Title, P.Research_Domain, R.Full_Name
FROM Project P
JOIN Project_Assignment PA ON P.Project_ID = PA.Project_ID
JOIN Researcher R ON PA.Researcher_ID = R.Researcher_ID
WHERE P.Status = 'Active';
 
-- Query 4: List all departments with the number of researchers in each, ordered by highest to lowest
SELECT D.Department_ID, D.Department_Name, COUNT(R.Researcher_ID) AS Number_of_Researchers
FROM Department D
LEFT JOIN Researcher R ON D.Department_ID = R.Department_ID
GROUP BY D.Department_ID, D.Department_Name
ORDER BY Number_of_Researchers DESC;
 
-- Query 5: List Project_ID, Title, and the Name of the research center hosting each project
SELECT P.Project_ID, P.Project_Title, RC.Center_Name
FROM Project P
JOIN Research_Center RC ON P.Center_ID = RC.Center_ID;
 
-- Query 6: Retrieve full name of researchers involved in more than one project with the number of projects
SELECT R.Full_Name, COUNT(PA.Project_ID) AS Number_of_Projects
FROM Researcher R
JOIN Project_Assignment PA ON R.Researcher_ID = PA.Researcher_ID
GROUP BY R.Researcher_ID, R.Full_Name
HAVING COUNT(PA.Project_ID) > 1;
