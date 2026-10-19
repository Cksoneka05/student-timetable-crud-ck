# ICT 251 Activity 4 — Question 3: Student Timetable & Goals
Stack: Node.js, Express, SQLite, HTML/CSS/JavaScript. Resource/table: `timetable`.

## Run locally
Install Node.js 18+, open a terminal in `backend`, run `npm install`, then `npm start`.
Open `frontend/index.html` (or serve the `frontend` folder with VS Code Live Server).
API: `http://localhost:3000/api/timetable`; health check: `http://localhost:3000/api/health`.
SQLite database is created automatically in `backend/data/timetable.db`.

## Endpoints
- GET `/api/timetable` — list records
- GET `/api/timetable/:id` — retrieve one
- POST `/api/timetable` — create
- PUT `/api/timetable/:id` — update
- DELETE `/api/timetable/:id` — delete

Import `postman/ICT251_Question3_Timetable.postman_collection.json` into Postman.
Run the requests yourself and record the required video showing method, URL, body where applicable, and actual JSON response. Do not claim tests or deployment are complete until verified.

The assignment's main task says SQLite, while its quick-start section mentions MySQL. This project follows the main task and uses SQLite. Seed data is illustrative sample data, not real observations.

## Cloud deployment
Deploy backend as a Node web service with root directory `backend`, build command `npm install`, start command `npm start`. SQLite requires persistent storage on the hosting provider. Set `DB_PATH` to a path on the persistent disk and set `CORS_ORIGIN` to your deployed frontend URL. Deploy `frontend` as a static site, then replace `API_URL` in `frontend/app.js` with the live backend API URL. Confirm current host-specific settings before deployment.
