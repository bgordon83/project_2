#!/bin/bash

curl "http://localhost:4741/workout_logs" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "workout_log": {
      "routine": "'"${ROUTINE}"'",
      "sets": "'"${SETS}"'",
      "reps": "'"${REPS}"'",
      "time_spent": "'"${TIME}"'",
      "user_id": "'"${ID}"'"
    }
  }'

echo
