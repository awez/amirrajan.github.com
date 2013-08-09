---
title: GTD - Genin Tsuikyu Dammit!
category: meta
layout: post
tags : [meta, testing, metrics]
---

_The tl;dr; is mid-page so as not to ruin the story._

##Nissan Motors, and Their Crappy U.S. Made Transmissions
_**This is a work of fiction**. Names, characters, places and incidents either are products of the author's imagination or are used fictitiously. Any resemblance to actual events or locales or persons or companies (or anything else not explicity stated in this ridiculous disclaimer), living or dead, is entirely coincidental._

In the 1960's, Nissan Motors expanded its market to the United States. In doing so, a portion of parts were to be built on American soil. Around this same time period, automotive innovation was in full force. Specifically with regard to automatic transmissions. An extremely bright team of American and Japanese engineers got together and spec'd out the first line of automatic transmissions to be used in Nissan automobiles.

The specifications for the new automatic transmissions were sent to the production lines in the United States and Japan. The transmissions were **complex, 863 _unique_ parts** needed to be assembled for this incredible piece of machinery. After a few grueling months, the assembly lines were ready to rock.

Initial roll out of these new transmissions went smoothly, given the due diligence of the engineers' extremely detailed specifications and the assembly lines that created the parts. However, after a few months with these vehicles on the road, **the transmissions began to fail**. Everyone was in a panic to say the least.

"How could this be?" thought everyone.

"We've hired top talent. The specs were spot on. All parts past quality assurance. What is going on?!?!?"

The search for an answer begins.

The failing transmissions were shipped back to the engineers. Upon initial inspection of the tracking records, they found that **all** of the failing transmissions where built in the United States.

"How could this be? _Not a single_ transmission built by the Japanese assembly line was in the failure log."

The engineers needed to get to the bottom of this. They requested a shipment of transmissions from the Japanese assembly line. Upon arrival, the team took apart each transmission... they inspected **all** 863 parts of **every** transmission.

The results? 

Well... when building machines as complex as this, the specifications have to give exact measurements for parts. With each part, also comes a _range for error_. All holes that needed to be drilled to build this transmission had a diameter specified, and a range of error between 1 and -1 _millimeters_.

All parts. Every single hole of the U.S. built transmissions. Yes. **100%** of the transmissions. Were within this margin of error. **No defects were found.**

The Japanese transmissions. Every single hole. All parts. Were **dead on**, exactly to spec.

The engineering team, astonished, called up the head of the Japanese assembly line.

"How did you do this? How did you get the all the holes on this transmission to spec??" asked the lead engineer

"Well... We saw that whenever we drilled a hole into the transmission, the drills would wobble ever so slightly... So we fixed them."

##tl;dr;
_When a problem occurs, make an assesment of the root causes (genin tsuikyu) instead of just fixing or adding constraints for the symptom. If you don't, you may suffer a death by 1000 paper cuts (or in the case above, failure by compound errors). Here are some examples in software development that relate to the story above. I'm aware that the solutions may not be feasible to all. But **think** about the root problems as opposed to just fixing the symptom._

##Code Coverage Targets
Measuring code coverage can be useful. **Forcing a minimum amount of code coverage is adding constraints as opposed to fixing the root problem**. The root cause may be that the team doesn't see the value in testing (or just doesn't have enough experience with it). Better solutions to consider:

- Make time for the developers to practice testing in a "safe environment". Code katas (usually a semi trivial problem where testing can be practiced) can help create the muscle memory needed to tackle a real system... and hopefully position your team to improve test coverage without _ever_ measuring it.
- Take time together and find the testing surfaces of whatever frameworks you're using to build your systems
- Consider changing/moving the underlying framework all together and use something more testable

##Micro Management
"The team doesn't seem to be putting in a full 40 hours a week! Lets make them log their times to .25 hour increments!!!"

Yes, that's the solution.

"Should we log the time it took to log our time?"

Things to consider:

- Is morale low?
- Are they bored with the work that's being done?
- Is the commute to work an issue? Can we improve this by shifting core hours? Allow for remote work?
- Is it an intrinsic part of our culture? Is "everyone doing it"? Should we just accept it and lower the number of required hours?

Again, consider root causes.

##Confirmation - Are you sure? Are you really really sure?
I received a request to clear out one of test environments (basically to "reset" one of our end user sandboxes). Welp. I passed in the wrong argument into the reset script and blew away a different environment... Luckily (after lots of panicking), we found that differential backups were being run against that environment every 15 minutes. In the retrospective, we talked about adding a Y/N confirmation to the script so that it doesn't happen again... famous last words. Better solutions to consider:

- Taking a backup before preforming a destructive action
- Adding an undo command to the script, and printing that command after the destructive command is executed
- Don't let me run that script anymore... T_T

##We Should Log That
Some error happens in production, some really nasty bug occurs. How many times have you fixed the bug and then added an entry into the log "just in case" the bug happens again. Instead. **Write a test for it** to ensure that it doesn't happen again. If you can't identify all the different scenarios that caused the error (or can't categorize it under test), _you have a bigger problem that wont be remedied by putting a log statement_.

##Beating a Dead Horse
Here are a few more scenarios to talk through and evaluate:

- Using only one stack/language. Does it solve all your problems? Or are you not given enough time to evaluate other options?
- Heavy handed process/tracking when bugs are found. Why are they happening in the first place?
- Projects continue to run over. Add more process and meetings? Is that really the solution?
- Too many issues and errors with deployment. Document and double check everything!!! How about automate everything?

GTD - <del>Get Things Done</del> Genin Tsuikyu Dammit!
