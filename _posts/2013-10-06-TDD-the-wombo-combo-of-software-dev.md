---
title: TDD - The Wombo Combo of Software Development
category: meta
layout: post
tags : [testing]
---

##tl;dr;

_Test Driven Development (TDD) is difficult to get good at, [here is a good way to get started](#getstarted). What makes things worse is that there is so much fervor around this technique. Newcomers may be immediately turned off by practitioners. At the end of the day, **it’s a two way street**. If you want to get better at TDD, you have to look past heated, seemingly ridiculous debates between practitioners and... **practice. Just like we do**. As practitioners, we need to continue to have the debates, but do a better job of generating artifacts (blog entries, gists, screen casts), and understand that **we don't have it all figured out**._

#The WOMBO COMBO!!!!

If you're a gamer, you may have heard of _Super Smash Brothers Melee_. This game was played competitively. National tournaments. Professional sponsorships. Cash prizes. In other words, **it was a big deal**.

I was in high school at the time this game came out. And a group of friends and I played this game every possible chance we got. We practiced, we studied the subtleties of it, and we competed in local tournaments.

Now that the stage is set. Watch the video with the following points in mind:

- If you've **never** played Super Smash Brothers Melee, you'll have no idea what just happened, nor why everyone is excited.

- If you've played this game a **little bit**, you may understand what happened, but don't see it as a big deal.

- If you've played this game a **lot**, you can appreciate what was shown. But you may say **it's nice to learn, but not necessary to compete at a professional level**.

- If you've played the game **competitively**, **(and understand the nuances of the game to the level these players did)**, you'd understand why this is regarded as one of the **greatest moments in this game's history**. What was shown in this video **fundamentally changed** how this game was played at every level.

- The commentary is a **complete turn off**. You may never want to participate, at a competitive level, after hearing these juvenile comments that **contain profanity and reference male genitalia**

- A message to practitioners of TDD, this is probably **what we sound like to newcomers**

>>The epic combo \[starting at 00:10] became to be considered as one of the greatest moments ever recorded in Super Smash Brothers history.
>>[source](http://knowyourmeme.com/memes/wombo-combo)

<iframe width="560" height="315" src="//www.youtube.com/embed/pD_imYhNoQ4" frameborder="0" allowfullscreen="allowfullscreen">wombo combo</iframe>

<br/>

#Reflect. Do you want to get better?

Reflect on your experience with test driven development. Where do you exist on the spectrum?

#Perspective. TDD is nice, but not necessary.

At the risk of categorizing based on past experiences, many developers are in this category. And as far as your perception of TDD is concerned, you are _absolutely right_. You can develop at a professional level, write good, high quality code without doing TDD.

**With regards to the two way street**

For those that have this opinion: Do not discourage others that want to learn TDD. If someone wants to write tests, let them. Don't complain. Support your teammate's perspective.

For TDD practitioners: you need to be okay with devs that hold the opposing perspective. If you're new to TDD, get better through **independent practice** before attempting anything on production code. **Do not impose testing on your peers** (if everyone isn't on board, do not incorporate it into continuous integration). And when one of the tests fails because of _their_ check-in, _you_ need to fix it. Because it's what _you_ value.

#Perspective. You are a practitioner of TDD, and so am I.

We compete. We measure and size each other up. We debate. Loudly. With fervor. All in the spirit of improving and pushing each other to the next level. Sometimes (unfortunately), cutting each other down.

We represent the players and spectators in that video.

No wonder others shy away from learning TDD.

But I (we) get it. When one can understand and compete at _that_ level, it's extremely rewarding and as far as we are concerned, there is simply no other way to "play".

**With regards to the two way street**

For everyone seeing these debates: As painful as it is to watch, try to understand that we care about the subject. We don't see what we do as naval gazing. We try our best to... well... be the best.

For the practitioners butting heads: **Document what you talk about**. Write a blog entry, leave artifacts for others to find (like [this one](http://lostechies.com/jimmybogard/2013/09/26/test-styles-and-avoiding-setupteardown/), [this one](http://wekeroad.com/2013/08/28/how-behavioral-is-your-bdd), [this one](http://www.hanselminutes.com/294/understanding-bdd-and-nspec-with-matt-florence-and-amir-rajan), and [this one](http://vimeo.com/72745278)). Keep engaging in this constant, unrelenting dialog.

TDD, BDD (testing in general) is a constantly changing area. **You're doing yourself a disservice if you think you've got it all figured out.**

#Perspective. I've never attempted TDD or have only tried it a little bit.

Practice. A lot. A whole lot. It's a long, long road to get extremely good at TDD. Frankly (for me), it's well worth the effort.

**With regards to the two way street**

For newcomers: try to look past the "commentary of the practitioners". Within the heated debates back and forth (and all the noise that comes with it), there is an important dialog that's occurring. We've worked our asses off to get to where we are, and with that comes some ill placed entitlement.

For TDD practitioners: keep your ego in check. Especially when talking to someone that is _willing_ to learn. Be very much aware that you can come off as sounding like the people in that video.

<div id="getstarted"></div>

#How to get started with TDD

Start with code katas (a cool way of saying coding problems).

Here is one.

####Prime Factors Kata

This kata is designed to help you get used to doing test driven development.

####Explanation

Write a method that takes in an integer and returns all prime factors for that number. For example, passing in the number 4 would return a list containing 2,2. Notice I said method...don't go creating a complicated class or project structure. Just create a test fixture and put a method right in there ;-).

####Goals

Start with the simplest implementation possible. Don't try to find a solution all at once. This kata will help you create the muscle memory to start with the most naive solution first. In fact, I'm recommending you write your tests in this order (again, only write enough code to make each test pass):

- primes for 0, returns empty list
- primes for 1, returns empty list
- primes for 2, returns 2
- primes for 3, returns 3
- primes for 4, returns 2,2
- primes for 5, returns 5
- primes for 6, returns 2,3
- primes for 9, returns 3,3
- primes for 2147483647, returns 2147483647

####En-passe

With this kata, you'll also learn the concept of an en-passe. Were there instances in this kata where your algorithm had to completely change? Your implementation should evolve as make more tests pass...if you find that your implementation changes drastically with each new test, repeat the kata until it evolves smoothly.

####Get Up and Running. Fast.

This was the first kata I tackled, and did it many many times. Every time you do this kata, think about how long it takes you to get your first failing test going (i.e. setting up the project/sln/folder structure and getting your test runner to execute the first failing test). Work at getting that first failing test up and running quickly.

####The Kata in Action

Here is the Prime Factors Kata _performed_ by Uncle Bob. This performance was scripted. A lot of work was put into developing the code in such a way where each change was **incremental and fluid**.

There are a few notable moments that really show how much practice and preperation was done.

Very subtle, **yet powerful** changes are made around minutes 3:30, 5:40, 6:28, and 8:28. Take the time to understand what these change are, and what kind of practice was needed to _nail them_ so elegantly.

<iframe src="//player.vimeo.com/video/7762511" width="560" height="315" frameborder="0" webkitallowfullscreen="webkitallowfullscreen" mozallowfullscreen="mozallowfullscreen" allowfullscreen="allowfullscreen">prime factors kata</iframe>

<p><a href="http://vimeo.com/7762511">Prime Factors Kata in Ruby, Flower Duet, Lakme'</a> from <a href="http://vimeo.com/user947916">unclebob</a> on <a href="https://vimeo.com">Vimeo</a>.</p>

###Other Katas to Try

Once you have done the Prime Factors Kata many, many, many times.

Try these katas:

- [Conway's Game of Life](http://codingdojo.org/cgi-bin/wiki.pl?KataGameOfLife)
- [Mancala](https://gist.github.com/amirrajan/2153731)
- [Gilded Rose](https://github.com/NotMyself/GildedRose)

###Here to Help

And feel free to reach out to me on [twitter (@amirrajan)](https://twitter.com/amirrajan), I'd be happy to help you get started.
