FROM node:latest
MAINTAINER @byt3smith

RUN npm install -g coffee-script yo generator-hubot  &&  \
	useradd hubot -m

USER hubot

WORKDIR /home/hubot

ENV DEV false

ENV BOT_NAME "hubot"
ENV BOT_OWNER "No owner specified"
ENV BOT_DESC "Hubot with Slack adapter"

ENV EXTERNAL_SCRIPTS=hubot-diagnostics,hubot-help,hubot-google-images,hubot-google-translate,hubot-pugme,hubot-maps,hubot-rules,hubot-shipit

RUN yo hubot --owner="$BOT_OWNER" --name="$BOT_NAME" --description="$BOT_DESC" --defaults && \
	npm install hubot-slack && \
	npm install hubot-scripts

RUN bin/hubot --adapter slack
