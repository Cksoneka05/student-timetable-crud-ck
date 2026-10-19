# ICT 251 — Activity 4: Single-Table CRUD App Using Node.js
## Question 3 — Student Timetable & Goals

**Student name:** cephas soneka____________________  
**Student number:** _202402741_________________  
**Programme:** Computer Science  
**University:** Mulungushi University  
**Lecturer:** _________________________  
**Academic year:** 2026  
**Submission date:** _________________

## 1. Introduction
This project manages student timetable entries and study goals using one SQLite table, a Node.js/Express JSON REST API, and a browser frontend.

## 2. Objectives
- Create one table with relevant timetable fields and sample records.
- Implement GET all, GET by ID, POST, PUT, and DELETE.
- Build a browser interface for adding, listing, editing, and deleting entries.
- Verify all endpoints in Postman and deploy the app.

## 3. Tools
Node.js, Express, SQLite, HTML, CSS, JavaScript, Postman, and environment variables.

## 4. Database design
The `timetable` table contains `id`, `course_code`, `course_name`, `day_of_week`, `start_time`, `end_time`, `location`, `study_goal`, `status`, `created_at`, and `updated_at`. Ten sample rows are provided as illustrative data, not real observations.

## 5. API endpoints
| Method | Endpoint | Purpose |
|---|---|---|
| GET | `/api/timetable` | List all records |
| GET | `/api/timetable/:id` | Retrieve one record |
| POST | `/api/timetable` | Create record |
| PUT | `/api/timetable/:id` | Update record |
| DELETE | `/api/timetable/:id` | Delete record |

## 6. Frontend
The HTML/JavaScript interface uses a form to create and update records and a table to show saved records. Edit loads the selected record into the form; Delete removes a record after confirmation. The list refreshes after changes.

## 7. Postman evidence — complete after real testing
| Test | Actual result | Screenshot/video reference |
|---|---|---|
| GET all | To be completed | __________________ |
| GET one | To be completed | __________________ |
| POST | To be completed | __________________ |
| PUT | To be completed | __________________ |
| DELETE | To be completed | __________________ |

The assignment requests a video showing methods, URLs, request bodies where relevant, and JSON responses. Run the requests and record your own evidence; do not mark a test successful before you have run it.

## 8. Deployment
Backend URL: __________________________  
Frontend URL: _________________________  
API base URL: _________________________  

Fill in only after deployment and link verification.

## 9. Revision and change log
| Version | Change | Date |
|---|---|---|
| 1.0 | Initial database, API, frontend, and documentation | 19 October 2026 |
| | Add your own revisions | |

## 10. GenAI declaration
Edit this declaration to match your actual use: “Generative AI assisted with planning and drafting parts of the project code and documentation. I reviewed, ran, tested, and adapted the work. I am responsible for understanding the implementation and verifying the results. Untested results and deployment details have not been represented as complete.”

## 11. Individual reflection
Write your own reflection after running the project:
1. What did you learn about REST API endpoints and HTTP methods?
2. What issue did you encounter connecting the frontend to the backend, and how did you solve it?
3. What did you learn about creating, updating, and deleting database records?
4. What would you improve next time?

Reflection:  
________________________________________________________________  
________________________________________________________________  
________________________________________________________________  

## 12. Conclusion
The project source implements the required single-table CRUD workflow. Postman video evidence, live deployment links, and personal reflection remain to be completed by the student.
