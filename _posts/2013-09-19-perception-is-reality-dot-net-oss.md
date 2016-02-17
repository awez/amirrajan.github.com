---
title: Perception is Reality - .Net OSS is DOA
category: meta
layout: post
tags : [oss]
---

## tl;dr; ##

_Microsoft is trying to change the mainstream (corporate) .Net culture. They are genuinely trying to promote open source software, without bias. And I can't thank people at Microsoft (like Glenn Block, Scott Hanselman, and Jon Galloway) enough for busting their asses trying to push open source initiatives. Unfortunately, a culture has built up that (so far) doesn't look like it's changed. The general stigma  (in large corporate environments) is still: "if it isn't made or endorsed by Microsoft, we won't use it."_

## Blog Responses ##

Others are taking the time to respond to what I've written. Happy to see conversations happening (if you have a response, let me know via email/twitter and I'll link to it):

<hr />

**[Perception Is Reality - .NET OSS Is Getting Better](http://nerditorium.danielauger.com/blog/2013/09/23/perception-is-reality-net-oss-is-getting-better/) by [Daniel Auger @danielauger](https://twitter.com/danielauger)**

<hr />

**[Perception is Reality - The state of OSS in .NET](http://lostechies.com/jimmybogard/2013/09/25/perception-is-realitythe-state-of-oss-in-net/) by [Jimmy Bogard @jbogard](https://twitter.com/jbogard)**

<hr />

**[Reality is an illusion – .NET OSS is hard](http://blog.markrendle.net/reality-is-an-illusion-net-oss-is-hard/) by [Mark Rendle
@markrendle](https://twitter.com/markrendle)**

<hr />

## Here's the Problem ##

.Net has a culture of being a walled garden, but in the most posioness way. It's an ecosystem where only frameworks built my Microsoft can succeed.

It simply comes down to this: You lose if you propose an idea that directly competes with Microsoft's ideas, or (worse) a framework that competes with the one of Microsoft's frameworks.

A lot of great frameworks/ideas come out in other ecosystems. Developers in their respective walled gardens clone these good ideas and bring them over.
But in the .Net ecosystem, these new ideas have a small chance of succeeding for one unfortunate reason: it isn't built by Microsoft.

Here are some examples.

## Nancy and Service Stack ##

Nancy and ServiceStack are web frameworks, but they directly competed with ASP.NET MVC. Two years later, ASP.NET WebApi came out and well...

>@TheCodeJunkie
>@xpaulbettsx @gblock we've promoted Nancy for 2½ years and Web API had more users after 1 week =)
[source](https://twitter.com/TheCodeJunkie/status/319321977259184128)

ServiceStack had its first commit in December of 2008. Nancy had their first commit in April of 2009. And ASP.NET WebApi came out in March of _2012_.

What happend during 3 years where ServiceStack and Nancy were the _superior_ options for REST Api's? Well. Developers fought ASP.NET MVC to make it return and bind to JSON payloads correctly (or worse yet, WCF REST).

Other communities don't have this problem. Here are some reimplementations of Sinatra on other stacks:

- Slim (PHP) had its first commit in September of 2010.
- Frank (F#) had its first commit in August of 2010.
- Express (NodeJS) had its first commit in June of 2009.
- Nancy (C#) had its first commit in April 2009.

But mainstream .Net sat on the sidelines until Web API.

## Sass and Less ##

CSS transpilers (things that made CSS easier to work with), started gaining adoption in other ecosystems. The first commits to Compass were in August of 2008. It took an out of process CLI
approach to creating CSS from Compass specifications. The .Net ecosystem didn't take advantage of this approach until it was integrated in to Visual Studio via Web Workbench in 2011. But
that's the wall garden that is .Net. If it isn't built by Microsoft and doesn't have Visual Studio integration, then it's a non-starter.

## Testing Frameworks ##

Lambda based testing frameworks was another interesting approach to composing test structures. Before these frameworks, the assumption was that the smallest assertable code block was a
class method. Lambda based testing frameworks changed that notion.

- Jasmine (JavaScript) Nov 2008
- RSpec (Ruby) Jun 2009
- NSpec (C#) Feb 2011
- Mocha (JavaScript) Aug 2011
- FunSpec (Scala) 2013

To this day, mainstream .Net devs will dismiss anything that isn't class and method based (MSTest, NUnit, XUnit). Adoption only has a chance if it's made my Microsoft and integrated into Visual Studio.
That's the status quo.

There are other examples. Everything from bundling/minification, build, to deployment. Other ecosystems are moving forward on all these fronts and mainstream .Net sits on their hands waiting
for a handful of developers at Microsoft to release their version. And whatever that version ends up being will be late to the game and subpar.

It _doesn't_ have to be this way. But everything is stacked up against those developers that want good things to come to .Net sooner.

## Notable Comments ##

A lot of good comments have been posted. Here are a few them. For the full spectrum of comments you can follow these threads: [my original tweet](https://twitter.com/amirrajan/status/381068801061568512), [this offshoot](https://twitter.com/jbogard/status/381091906702565376), [another offshoot](https://twitter.com/AquaBirdConsult/status/381070709554184192), [this retweet](https://twitter.com/randompunter/status/381378264142716928), and [reddit](http://www.reddit.com/r/programming/comments/1mskjc/ask_proggit_is_my_perception_of_net_oss_accurate/).

<hr/>

>Not pointing blame per-say, I'm saying MS is one of the view tech companies that competes with it's community

[source](https://twitter.com/TheCodeJunkie/status/319323827677057025)

<hr/>

>we've promoted Nancy for 2½ years and Web API had more users after 1 week =)

[source](https://twitter.com/TheCodeJunkie/status/319321977259184128)

<hr/>

>it sounds like you’re not arguing for OSS, but arguing against the manner in which enterprises assess risk

[source](https://twitter.com/jbogard/status/381091906702565376)

<hr/>

>Lots of OSS frameworks seem obsessed with being highly opinionated and with "look at few lines that took"

[source](https://twitter.com/darrel_miller/status/381089950063542272)

<hr/>

>Solve a specific problem and people will use it.  Asking an enterprise to buy a philosophy is another story

[source](https://twitter.com/darrel_miller/status/381090756397522945)

<hr/>

>I think \[this blog post\] is terribly unfair, especially to @shanselman & co who spend their days boiling frogs. Will comment later!

[source](https://twitter.com/Cranialstrain/status/381385107690754049)

>As was once written, we are a product of our environment, and therefore it is the environment which is at fault and not MS for supplying it. I also have to say we as developers bear responsibility for influencing and changing our environments, if that seems beyond your reach - change your environment - vote with your feet!

[source](http://disq.us/8f96c2)

<hr/>

>IT management doesn't care, they want SLAs and someone to hold accountable

[source](https://twitter.com/eddiegarmon/status/381411163910983680)

<hr/>

>On the timeline presented there is a framework called ServiceStack which I successfully used to significantly simplify internal APIs, used by multiple internal systems, back in early 2011.

>Recently we brought on a new developer whose first question was "Why didn't you use Microsoft's WebApi". I had to gently explain that I couldn't use something that didn't exist. So I definitely feel the author's pain.

[source](https://news.ycombinator.com/item?id=6419165)

<hr/>

>Microsoft puts a lot of emphasis on visual designer support and integration with Visual Studio. The big bulk of people who build enterprise apps on .NET are more concerned with business goals rather than actual coding. They don't want to leave Visual Studio, don't want to mess with the command line, don't want to edit XML files, don't want to experiment with new things, and generally just want to drag and drop things, press the play button, and have the program do its thing. This has been the experience that Microsoft tools have been giving for the longest time, especially on the Visual Basic side.

>People who contribute to OSS, on the other hand, have a completely different mentality towards development. In general, people who participate in OSS are enamored a lot more with computers and the experience of tinkering and experimenting, and have less concerns over deadlines or meeting business goals. A lot of the OSS tech has a steep learning curve that involves reading documentation, figuring out how to configure the thing, using command line tools, so on and so forth.

>When Microsoft introduces new technology, it's usually accompanied with massive training events, conferences, webcasts, videos, technotes, documentation, etc. All of this is necessary to push the new tech into the business developer's consciousness and make him comfortable trying something new. This isn't necessarily because they're bad developers, it's just most enterprise work requires that you spend less of your energy on implementation details, and focus more on the business logic, which is complex enough on its own.

>Say what you want about how inefficient MS's "clones" are, but for the most part, I've been able to pick up and start working with almost all of their technologies (with the possible exception of WCF and WPF) just by opening Visual Studio and clicking things until it did what I wanted. I've recently inherited an application written in VB6, and I'm really quite happy about how straight-forward it all is, even if it is often sloppy and inelegant.

>If the OSS community wants more adoption by "the mainstream", then they need to understand that "the mainstream" does not care who you are, they don't want to read your manual, nor they care about how elegant your code is. They need tremendous amounts of support, they expect a huge focus on ergonomics and polished edges, and to appeal to them you will need to do a lot of hard things that are not as fun as programming your pet project.

[source](http://www.reddit.com/r/programming/comments/1mskjc/ask_proggit_is_my_perception_of_net_oss_accurate/cccdlc0)

<hr/>

>I love OSS, I really do, but for "enterprise" and "corporate" developers, and even those of us who are more open to trying new things and don't always rely upon getting our knowledge from the pre-chewed information spoon-fed to us by Microsoft, we're almost always better off with the Microsoft "solution". This is true for any developer (and this is probably most of all of us) who has a "deadline".

>Tooling, Documentation & Community (number of users) are the factors that ensure this is true time and time again.

[source](http://www.reddit.com/r/programming/comments/1mskjc/ask_proggit_is_my_perception_of_net_oss_accurate/ccd442t)

<hr />

>It was always a problem.

>Castle Monorail (inspired by RoR) was developed since 2004 but web-MVC only caught up with ASP.NET MVC in 2007.

>Castle Windsor is (IMHO) most powerful DI/IoC container, and exists as long as Castle, IIRC. Besides it, there're Spring.NET, nInject, AutoFac and some more. But for most IoC only caught up with Unity and MEF in 2008.

>nHibernate started around 2005. So did Subsonic, xBatis etc. But people only got caught with LINQ to SQL and EF, which are much more limited in their capabilities.

>nUnit was started in 2000, Visual Studio Test Framework was released with VS 2005.

>And this is just plain sad.

>I can understand delay between idea emerging in one ecosystem and its spread to other ones — people need time to adapt ideas. And here .NET isn't always the slowest kid on the playground (e.g., with web microframeworks, Nancy predates both Express and Slim).

>Eventually, idea gets caught at Microsoft itself, and guys at DevDiv are wondering why nobody uses this cool idea and implements its own version. That's understandable too.

>But the slowness and indecisiveness of average developer are astounding. And the fact that release of the similar tool by Microsoft usually puts one or more ALT.NET project to extinction is extremely sad.

>Things might change a bit with Nuget simplifying access to packages developed by community. Ironically, Nuget is third or fourth package management tool for .NET I remember trying and the only one that caught, again, because it's got MS blessing.

>Disclosure: I express my own opinion which might be different from that of my employer, Microsoft.

[source](http://www.reddit.com/r/programming/comments/1mskjc/ask_proggit_is_my_perception_of_net_oss_accurate/ccc8rt3)
