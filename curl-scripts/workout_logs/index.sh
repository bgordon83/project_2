#!/bin/bash

curl "http://localhost:4741/workout_logs" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
