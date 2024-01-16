#!/bin/bash
curl -i --header "Content-Type: application/json" --header "Authorization: Basic YWRtaW46c2VjcmV0" --request PUT http://44.198.29.234:8080/videos 
curl -i --header "Content-Type: application/json" --header "Authorization: Basic YWRtaW46c2VjcmV0" --request POST --data "@./services/mongocatalogue/videos.json" http://44.198.29.234:8080/videos
