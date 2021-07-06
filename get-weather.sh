#!/bin/bash

# Source: https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/openweathermap-detailed
# Dependencies: curl
#               jq

key=""
city=""

response=$(curl -sf "https://api.openweathermap.org/data/2.5/weather?appid=$key&q=$city&units=metric")

weather=$(echo $response | jq -r ".weather[0].main")
temperature=$(echo $response | jq -r ".main.temp")

echo "$weather $temperature °C"
