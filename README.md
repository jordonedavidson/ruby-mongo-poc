# A Proof-of-Concept for Docker, Ruby and MongoDB

This is a minimal app to demonstrate using Docker to serve a self-contained Ruby app and Mongo databsase.

The conditions are:

- Both the Ruby app and Mongo database must exist in separate containers
- The database user and password must be set via environment variables at run-time.
- The data must persist over multiple restarts of the containers.

## Running the app.

Clone this repository and run `docker-compose up -d --build` from the root directory.

Visiting the page http://127.0.0.1:4568/health should produce a plain page with the word **Healthy** on it.

Adding tasks to the db is done via curl commands from the CLI like:

```
curl -d 'task[title]=first&task[description]=do+no+harm' http://127.0.0.1:4568/tasks
```

After a few tasks are entered. http://127.0.0.1:4568/tasks will present a JSON array of task objects.

Adding the task id to the path should bring up that specific task object. _ex._ http://127.0.0.1:4568/tasks/654546fa9795b9000caea373
