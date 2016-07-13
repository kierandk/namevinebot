# heroku-twitter-bot
Dead-simple wrapper to get Chatterbot running in Heroku in as little as 5 minutes

# Your Twitter bot live on Heroku in 5 minutes
## Fork this repository
* Click the Fork button here https://github.com/staringispolite/heroku-twitter-bot
* git clone to your local machine
## Make a Twitter account for your bot
https://www.twitter.com
## Register a Twitter app & bot auth token


* https://apps.twitter.com/
* Enter the into to create a new app
* Run `bundle install` to install dependencies
* In the top level of the new bot repo, type `chatterbot-register` and follow the directions on-screen to OAuth the bot to your app. Make sure when you follow the OAuth link in your browser to authorize the bot, you load that page as the bot user. You'll get a pin to type back into the command line to complete the auth.
* Note the token and secret Twitter generates. It should be in the output from `chatterbot-register`.
* If you have trouble at this step, see Chatterbot's instructions here: http://muffinista.github.io/chatterbot/setup.html

## Make your heroku app
* Assumes you've already installed Heroku Toolbelt CLI: https://toolbelt.heroku.com/
* `heroku create yourbotname`
* `heroku plugins:install git://github.com/ddollar/heroku-config.git`

## Your actual app logic
* Rename the .rb and .yml files to your app name if need be
* Examples of what you can do with Chatterbot: http://muffinista.github.io/chatterbot/examples.html

## Test changes locally
Probably with `debug_mode` and/or `no_update` on.

## Run live on Heroku
* Change the line in `Procfile` to match your bot's `.rb` file
* In your Heroku dashboard, add config vars for `CONSUMER_KEY`, `CONSUMER_SECRET`, `TOKEN`, `SECRET`, and set `ENV` = `PRODUCTION` (Ignore this for now - not working on ENV vars yet)
* `git push heroku master`
* In your Heroku dashboard, turn the worker process on.

## That's it!
* `heroku logs -t` to see what it's doing
 ##Signature base string GET&https%3A%2F%2Fapi.twitter.com%2F1.1%2F&oauth_consumer_key%3DhhHWNvo0yLibWFjt8CrL9Qz2z%26oauth_nonce%3D2197aeea6da5c7851e780bbe07eae632%26oauth_signature_method%3DHMAC-SHA1%26oauth_timestamp%3D1467829934%26oauth_token%3D750050036638162944-J501UubvPCgHoNXwW1cFIeD6GSmbj6E%26oauth_version%3D1.0
Authorization header Authorization: OAuth oauth_consumer_key="hhHWNvo0yLibWFjt8CrL9Qz2z", oauth_nonce="2197aeea6da5c7851e780bbe07eae632", oauth_signature="efI3VSP7mRe6CX7mBsEDXJjCvEA%3D", oauth_signature_method="HMAC-SHA1", oauth_timestamp="1467829934", oauth_token="750050036638162944-J501UubvPCgHoNXwW1cFIeD6GSmbj6E", oauth_version="1.0"
cURL command curl --get 'https://api.twitter.com/1.1/' --header 'Authorization: OAuth oauth_consumer_key="hhHWNvo0yLibWFjt8CrL9Qz2z", oauth_nonce="2197aeea6da5c7851e780bbe07eae632", oauth_signature="efI3VSP7mRe6CX7mBsEDXJjCvEA%3D", oauth_signature_method="HMAC-SHA1", oauth_timestamp="1467829934", oauth_token="750050036638162944-J501UubvPCgHoNXwW1cFIeD6GSmbj6E", oauth_version="1.0"' --v