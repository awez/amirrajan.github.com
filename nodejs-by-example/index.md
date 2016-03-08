---
layout: page
title: NodeJS by Example
header: NodeJS by Example
group: navigation
---
{% include JB/setup %}

I prefer not to write blog post showing coding samples. They tend to go stale and lose relevance quickly. Instead, I publish sample apps to GitHub with pretty damn good documentation. You can pull these apps down, build and run them yourself.

If you want to learn NodeJS, the resources below will help you.


## List of NodeJS Sample Apps ##

These apps are ordered by complexity/difficulty.

The apps are all released under MIT or Creative Commons Non-Commercial.

All have readmes that will guide you in building, running and deloying the apps.

If you find a problem with any of these apps, open a GitHub issue. Or even better, send me a pull request with updates.

## Word Finder ##

Search the entire english dictionary for words that match a specfic pattern. Great little website that will "help" you in games such as Words with Friends.

This app is a pretty bare bones app. There is enough non-trival code in here for you to get a grasp on the structure of a NodeJS app and how you can do something useful with the platform. It uses a lean and powerful web framwork called <code>express</code> and a light weight templating engine called <code>ejs</code>.

Libraries used: express, ejs

Source: [https://github.com/amirrajan/word-finder](https://github.com/amirrajan/word-finder)

## Celebrity Chat ##

A simple chat app. Each person that comes to the page gets assigned the name of a celebrity. You can chat with each other. Role play. Keep it PG.

This app shows, what I feel, is the killer feature of NodeJS: websockets. The code is fairly simple. It exchanges a few messages with server and client in realtime. The libraries used are <code>express</code>, <code>ejs</code> and a websockets library called <code>socket.io</code>.

Libraries used: express, ejs, socket.io

Source: [https://github.com/amirrajan/nodejs-chat](https://github.com/amirrajan/nodejs-chat)

## Todo List ##

A todo list. Add, update items. Mark them as done.

This app shows one of many ways you can persist data in NodeJS. It uses an extremely fast, in memory key value data store called <code>redis</code>. After understanding this app (and the two apps above), you'll have everything you need to start building web applications using NodeJS: web framework, realtime communciation with websockets, and a way to save data.

Libraries used: express, ejs, redis

Source: [https://github.com/amirrajan/nodejs-todo](https://github.com/amirrajan/nodejs-todo)

## Pomodoro Text ##

A Pomodoro client with a text messaging interface. The Pomodoro Technique is used for time management.

This app is a "warm up" for the next app (Sortis). You'll see how to use Redis, Angular, and Twilio (a text messaging service) in a simple application. This app will also get you a familiar with Grunt (a JavaScript task runner).

Libraries used: express, ejs, redis, angularjs, twilio, underscore

Source: [https://github.com/amirrajan/pomodoro-text](https://github.com/amirrajan/pomodoro-text)

## Sortis - Twitter Mashup ##

This app is a twitter client with a two phase authorization scheme (password and text). It allows you to search and add additional metadata to tweets. Read the readme for more information.

This app shows a non-trivial use of <code>express</code>, <code>ejs</code>, <code>redis</code> and a front end framework called <code>angularjs</code>. You'll also learn how to leverage Twitter's REST Api's and Twilio, a service that allows you to send text messages. There is a lot of comments in this code base. Read the source for more information.

Libraries used: express, ejs, redis, angularjs, twilio, underscore, oauth, request

Source: [https://github.com/amirrajan/sortis](https://github.com/amirrajan/sortis)

## Cards Against Humanities ##

This is a port of the game Cards Against Humanities. It's released under Creative Commons Non-Commercial.

This app shows a non-trival (but still simple) usage of <code>socket.io</code>. It's also mobile friendly and has fallbacks in place for clients that have a "not so reliable" internet connection. There is also a test suite associated with this code base using a library called <code>jasmine-node</code>.

Libraries used: express, ejs, underscore, socket.io, jasmine-node

Source: [https://github.com/amirrajan/nodejs-against-humanity](https://github.com/amirrajan/nodejs-against-humanity)

## Nodekick ##

This is a real time, multiplayer fighting game currently hosted [here](http://node-kick.herokuapp.com). This codebase is a cleaned up version of what our team built for Node Knockout 2013. Out of 385 teams, we placed 15th overall and 6th in the "fun/utility" category.

The app shows a non-trivial usage of <code>socket.io</code> and a HTML5 canvas framework called <code>pixijs</code>. The app shows how you can share common code on the server and client (in this case the physics engine).
It also shows how you can use interpolation techniques to handle updates to clients for a game that runs at 60 frames per second. You'll also get some insight on how to create "good" NodeJS modules (when to use JavaScript
in a class centric format vs a functional format). The commit history is fairly clean. Step through the commit history to see how the app evolved over time.

Libraries used: express, ejs, underscore, socket.io, jasmine-node, pixijs.

Source: [https://github.com/amirrajan/nodekick](https://github.com/amirrajan/nodekick)
