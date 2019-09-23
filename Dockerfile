FROM python:3.7-slim-buster

ARG slack_api_token

WORKDIR /app

# install requirements
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN mkdir /docker-entrypoint-initdb.d


# only if you want to add your historical data to the bot-archive database, add in your volume the directory 
# called "directory-with-initial-export" with inside the export you downloaded https://get.slack.help/hc/en-us/articles/201658943-Export-your-team-s-Slack-history
# questo nel docker-entrypoint.sh: RUN [ "python", "import.py", "/docker-entrypoint-initdb.d" ]

COPY import.py ./
COPY archivebot.py ./
COPY docker-entrypoint.sh /usr/bin/

ENV SLACK_API_TOKEN $slack_api_token

# run
# CMD [ "python", "archivebot.py" ]
ENTRYPOINT [ "/usr/bin/docker-entrypoint.sh" ]

#
# docker run --volume $(pwd)/dump:/docker-entrypoint-initdb.d <image>
# 
# if [ ! -f /var/lock/NON_DUE_VOLTE ]; then
#     import.py
#     touch /var/lock/NON_DUE_VOLTE
# fi
