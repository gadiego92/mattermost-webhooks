# mattermost-webhooks

## Setup

Just clone the repository and create a cronjob:

```
# Thursdays at 9:25
15 9 * * 4 sh ~/mattermost-webhooks/meeting-reminder/meeting-reminder.sh >> ~/mattermost-webhooks/logs/meeting-reminder.log 2>&1
```
