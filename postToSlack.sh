#!/usr/bin/env bash

function usage {
    programName=$0
    echo "description: use this program to post messages to Slack channel"
    echo "usage: $programName [-t \"sample title\"] [-b \"message body\"] [-c \"mychannel\"] [-u \"slack url\"]"
    echo "	-t    the title of the message you are posting"
    echo "	-b    The message body"
    echo "	-c    The channel you are posting to"
    echo "	-u    The slack hook url to post to"
    exit 1
}

while getopts ":t:b:c:u:h" opt; do
  case ${opt} in
    t) msgTitle="$OPTARG"
    ;;
    u) slackUrl="$OPTARG"
    ;;
    b) msgBody="$OPTARG"
    ;;
    c) channelName="$OPTARG"
    ;;
    h) usage
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

if [[ ! "${msgTitle}" ||  ! "${slackUrl}" || ! "${msgBody}" || ! "${channelName}" ]]; then
    echo "all arguments are required"
    usage
fi

read -d '' payLoad << EOF
{
        "channel": "#${channelName}",
        "username": "DeploymentBot",
        "icon_emoji": ":truck:",
        "attachments": [
            {
                "fallback": "${msgTitle}",
                "color": "good",
                "title": "${msgTitle}",
                "text": "${msgBody}"         
            }
        ]
    }
EOF


statusCode=$(curl \
        --write-out %{http_code} \
        --silent \
        --output /dev/null \
        -X POST \
        -H 'Content-type: application/json' \
        --data "${payLoad}" ${slackUrl})

echo ${statusCode}
