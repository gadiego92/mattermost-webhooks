#!/bin/bash

# Mattermost webhook URL must be defined as an env variable

if [ -z "${MATTERMOST_SMARTRECRUITERS}" ]
then
  echo "Error ! MATTERMOST_SMARTRECRUITERS env variable not found !"
  exit 1
fi

FULL_PATH="$(dirname $BASH_SOURCE)"

# Get the weekday number (e.g. 4)
WEEKDAY_NUMBER="$(date +%u)"

# Secial case (Thursday)
if [ "${WEEKDAY_NUMBER}" -eq 1 ]
then
  # It's Monday

  # Get the position from a Python script
  MESSAGE="$(python3 ${FULL_PATH}/html_parser.py)"

  # Run the curl command to send a reminder message to a Mattermost channel
  curl -i -X POST  \
    -H "Content-Type: application/json" \
    -d "{\"text\": \"${MESSAGE}\"}" \
    ${MATTERMOST_SMARTRECRUITERS}
    
  # Check the curl command return code
  if [ "${?}" -ne 0 ]
  then
    echo "ERROR!"
  fi
fi

