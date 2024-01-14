#!/bin/bash
curl -i --header "Content-Type: application/json" --header "Authorization: Basic $AUTH" --request PUT http://localhost:8080/videos 
curl -i --header "Content-Type: application/json" --header "Authorization: Basic $AUTH" --request POST --data "@./services/mongocatalogue/videos.json" http://localhost:8080/videos
