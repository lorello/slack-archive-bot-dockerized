# Dockerized Slack ArchiveBot

Dockerized version of https://github.com/docmarionum1/slack-archive-bot

## Installation

1. Create an app in your Slack: https://api.slack.com/apps and click "Create new App"
1. Create a "Bot User" for that app: click "Bot Users" in app settings, then "Add a Bot User": username "archivebot", Display Name: "ArchiveBot"
1. Install the app in your Slack Worplace
1. Use, in code below, the "Bot User OAuth Access Token" you can see at the "OAuth & Permissions" menu
1. Clone this repo 
1. Build docker container with 

      docker build slack_api_token=XXXXXXXXXXXXXXXXXXXXX -t slack-archive-bot .

1. Create a volume where to store the sqlite database file (slack.sqlite)

      docker volume create  slack-archive-bot

1. Run the container 

        docker run  --mount source=slack-archive-bot,target=/app slack-archive-bot


## Archiving New Messages

When running, ArchiveBot will continue to archive new messages for any channel it
is invited to.  To add the bot to your channels:

        /invite @ArchiveBot

If @ArchiveBot is the name you gave your bot user.

## Searching

To search the archive, direct message (DM) @ArchiveBot with the search query.
For example, sending the word "pizza" will return the first 10 messages that
contain the word "pizza".  There are a number of parameters that can be provided
to the query.  The full usage is:

        <query> from:<user> in:<channel> sort:asc|desc limit:<number>

        query: The text to search for.
        user: If you want to limit the search to one user, the username.
        channel: If you want to limit the search to one channel, the channel name.
        sort: Either asc if you want to search starting with the oldest messages,
            or desc if you want to start from the newest. Default asc.
        limit: The number of responses to return. Default 10.


## Contributing

Contributions are more than welcome, but for non docker contributions better go to the repo I forked.  

## License

Code released under the [MIT license](LICENSE).
