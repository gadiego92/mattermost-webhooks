#!/bin/bash

# Mattermost webhook URL must be defined as an env variable

if [ -z "${MATTERMOST_MEETING}" ]
then
  echo "Error ! MATTERMOST_MEETING env variable not found !"
  exit 1
fi

# Get the weekday number (e.g. 4)
WEEKDAY_NUMBER="$(date +%u)"

# Secial case (Thursday)
if [ $WEEKDAY_NUMBER -eq 4 ]
then
  # It's Thursday

  # Get the full weekday name (e.g. Thursday)
  WEEKDAY_NAME="$(date +%A)"

  # Set the meeting start time
  MEETING_TIME="09:30"

  # Run the curl command to send a reminder message to a Mattermost channel
  curl -i -X POST  \
    -H 'Content-Type: application/json' \
    -d '{"text": ":pushpin: Good morning @channel!\nThis is a friendly reminder about our daily meeting.\nIt is '${WEEKDAY_NAME}' and the meeting starts at '${MEETING_TIME}'!"}' \
    ${MATTERMOST_MEETING}

  # Check the curl command return code
  if [ $? -ne 0 ]
  then
    echo "ERROR!"
  fi
fi
