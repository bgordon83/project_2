 


Authentication Endpoints and Curl Scripts
Verb	URI Pattern	Controller#Action
POST	/sign-up	users#signup
POST	/sign-in	users#signin
PATCH	/change-password	users#changepw
DELETE	/sign-out	users#signout
POST	/workout_logs	workout_logs#create
GET	/workout_logs	workout_logs#index
GET	/workout_logs/:id	workout_logs#show
PATCH	/workout_logs	workout_logs#update
DELETE	/workout_logs	workout_logs#destroy
POST /sign-up
Request:

curl http://localhost:4741/sign-up \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'
EMAIL=ava@bob.com PASSWORD=hannah curl-scripts/auth/sign-up.sh
Response:

HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com"
  }
}
POST /sign-in
Request:

curl http://localhost:4741/sign-in \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
EMAIL=ava@bob.com PASSWORD=hannah curl-scripts/auth/sign-in.sh
Response:

HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
PATCH /change-password
Request:

curl --include --request PATCH "http://localhost:4741/change-password" \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
OLDPW='hannah' NEWPW='elle' TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh curl-scripts/auth/change-password.sh
Response:

HTTP/1.1 204 No Content
DELETE /sign-out
Request:

curl http://localhost:4741/sign-out \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
TOKEN='BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f' sh curl-scripts/auth/sign-out.sh
Response:

HTTP/1.1 204 No Content
POST /workout_logs
Request:

curl http://localhost:4741/workout_logs \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
   
      "routine": "ARMS",
      "reps": "3",
      "sets": "4",
      "time_spent": "60"
    
  }'
EMAIL=ava@bob.com PASSWORD=hannah curl-scripts/auth/sign-up.sh
Response:

HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com"
  }
}
GET /workout_logs
Request:

curl http://localhost:4741/workout_logs \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
 
  }'
EMAIL=ava@bob.com PASSWORD=hannah curl-scripts/auth/sign-up.sh
Response:

HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "workout_logs": { [
    "id": 1,
    "reps": "4",
    "routine": "arms",
    "sets": "3",
    "time_spent": "40",
    ["id": 2,
    "reps": "4",
    "routine": "arms",
    "sets": "3",
    "time_spent": "40"    ]
    }
GET /workout_logs
Request:

curl http://localhost:4741/workout_logs/1 \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
 
  }'
EMAIL=ava@bob.com PASSWORD=hannah curl-scripts/auth/sign-up.sh
Response:

HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "workout_logs": { [
    "id": 1,
    "reps": "4",
    "routine": "arms",
    "sets": "3",
    "time_spent": "40"
    }
PATCH /workout_logs/:id
Request:

curl http://localhost:4741/workout_logs/1\
  --include \
  --request Patch \
  --header "Content-Type: application/json" \
  --data:  params{routine: arms sets: 20 reps: 20 time_spent: 20, id: 1}
  }'
EMAIL=ava@bob.com PASSWORD=hannah curl-scripts/auth/sign-up.sh
Response:

HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "workout_logs": { [
    "id": 1,
    "reps": "20",
    "routine": "arms",
    "sets": "20",
    "time_spent": "20"
    }
DELETE /workout_logs/:id
Request:

curl http://localhost:4741/workout_logs/1\
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
 
  }'
EMAIL=ava@bob.com PASSWORD=hannah curl-scripts/auth/sign-up.sh
