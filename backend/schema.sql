CREATE TABLE IF NOT EXISTS timetable (
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 course_code TEXT NOT NULL,
 course_name TEXT NOT NULL,
 day_of_week TEXT NOT NULL,
 start_time TEXT NOT NULL,
 end_time TEXT NOT NULL,
 location TEXT NOT NULL,
 study_goal TEXT NOT NULL,
 status TEXT NOT NULL DEFAULT 'Planned' CHECK(status IN ('Planned','In Progress','Completed')),
 created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO timetable(course_code,course_name,day_of_week,start_time,end_time,location,study_goal,status)
SELECT 'ICT101','Introduction to ICT','Monday','08:00','10:00','Lecture Room A','Review chapter notes','Planned'
WHERE NOT EXISTS(SELECT 1 FROM timetable);
INSERT INTO timetable(course_code,course_name,day_of_week,start_time,end_time,location,study_goal,status)
SELECT 'CSC111','Introduction to Programming','Monday','10:00','12:00','Computer Lab 1','Practise basic algorithms','In Progress' WHERE (SELECT COUNT(*) FROM timetable)<2;
INSERT INTO timetable(course_code,course_name,day_of_week,start_time,end_time,location,study_goal,status)
SELECT 'MAT111','Mathematics for Computing','Tuesday','08:00','10:00','Lecture Room B','Complete problem set','Planned' WHERE (SELECT COUNT(*) FROM timetable)<3;
INSERT INTO timetable(course_code,course_name,day_of_week,start_time,end_time,location,study_goal,status)
SELECT 'ICT251','Web Application Development','Tuesday','10:00','12:00','Computer Lab 2','Build a REST endpoint','In Progress' WHERE (SELECT COUNT(*) FROM timetable)<4;
INSERT INTO timetable(course_code,course_name,day_of_week,start_time,end_time,location,study_goal,status)
SELECT 'STA111','Statistics','Wednesday','08:00','10:00','Lecture Room C','Revise descriptive statistics','Planned' WHERE (SELECT COUNT(*) FROM timetable)<5;
INSERT INTO timetable(course_code,course_name,day_of_week,start_time,end_time,location,study_goal,status)
SELECT 'DBS201','Database Systems','Wednesday','12:00','14:00','Computer Lab 1','Practise SQL queries','In Progress' WHERE (SELECT COUNT(*) FROM timetable)<6;
INSERT INTO timetable(course_code,course_name,day_of_week,start_time,end_time,location,study_goal,status)
SELECT 'NET201','Computer Networks','Thursday','08:00','10:00','Lecture Room A','Summarise network layers','Planned' WHERE (SELECT COUNT(*) FROM timetable)<7;
INSERT INTO timetable(course_code,course_name,day_of_week,start_time,end_time,location,study_goal,status)
SELECT 'SWE202','Software Engineering','Thursday','10:00','12:00','Lecture Room D','Review development models','Completed' WHERE (SELECT COUNT(*) FROM timetable)<8;
INSERT INTO timetable(course_code,course_name,day_of_week,start_time,end_time,location,study_goal,status)
SELECT 'SEC201','Information Security','Friday','08:00','10:00','Lecture Room B','Read access control notes','Planned' WHERE (SELECT COUNT(*) FROM timetable)<9;
INSERT INTO timetable(course_code,course_name,day_of_week,start_time,end_time,location,study_goal,status)
SELECT 'HCI201','Human-Computer Interaction','Friday','10:00','12:00','Lecture Room C','Sketch interface improvements','Completed' WHERE (SELECT COUNT(*) FROM timetable)<10;
