---
layout: page
title:
---
{% include JB/setup %}

I'm just a guy trying to figure out why in the world I have a such a passion for software development. Through my struggles with the human condition, I share my little blip of an existence through [**presenting**](/about/), [**this blog**]({{ HOME_PATH }}), [**github**](http://github.com/amirrajan), [**twitter**](http://twitter.com/amirrajan), and [**vimeo**](/screencasts/).

##Notables

<div style="line-height: 15px; padding-bottom: 10px">
  <a href="{{ BASE_PATH }}/nodejs-by-example">NodeJS by Example</a>
  <br/><br/>
  <span style="color: #767676; font-size: 12px">A list of NodeJS apps I've built to help you get started with the platform</span>
</div>
<div style="line-height: 15px; padding-bottom: 10px"><br/>
  <a href="{{ BASE_PATH }}/a-dark-room">A Dark Room for iOS</a>
  <br/><br/>
  <span style="color: #767676; font-size: 12px">Official release of A Dark Room on iOS</span>
</div>
<div style="line-height: 15px; padding-bottom: 10px"><br/>
  <a href="{{ BASE_PATH }}/12k-lines-of-RM">12,000 Lines of RubyMotion</a>
  <br/><br/>
  <span style="color: #767676; font-size: 12px">A presentation about A Dark Room and using RubyMotion</span>
</div>

##Posts

{% for post in site.posts %}
  <div style="line-height: 13px; padding-bottom: 10px">
    <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a><br/>
    <span style="color: #767676; font-size: 12px">{{ post.date | date_to_string }}</span>
  </div>
{% endfor %}

