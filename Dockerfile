FROM python:3.7-slim-buster

ARG slack_api_token

# Use a volume as working directory 
VOLUME /app
WORKDIR /app

# install requirements
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY import.py ./
# only if you want to add your historical data to the bot-archive database, add in your volume the directory 
# called "directory-with-initial-export" with inside the export you downloaded https://get.slack.help/hc/en-us/articles/201658943-Export-your-team-s-Slack-history
CMD [ "python", "import.py directory-with-initial-export" ]

COPY archivebot.py ./
ENV SLACK_API_TOKEN $slack_api_token

# run
CMD [ "python", "archivebot.py" ]

