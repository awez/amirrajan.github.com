---
layout: page
title:
---
{% include JB/setup %}

I'm just a guy trying to figure out why in the world I have a such a passion for software development. Through my struggles with the human condition, I share my little blip of an existence through [**presenting**](/about/), [**this blog**]({{ HOME_PATH }}), [**github**](http://github.com/amirrajan), [**twitter**](http://twitter.com/amirrajan), and [**vimeo**](/screencasts/).

##Notables

<div style="line-height: 15px; padding-bottom: 10px">
  <a href="{{ BASE_PATH }}/nodejs-by-example">NodeJS by Example</a>
  <br style="padding: 5px"/>
  <span style="color: #767676; font-size: 12px">A list of NodeJS apps I've built to help you get started with the platform</span>
</div>
<div style="line-height: 15px; padding-bottom: 10px"><br/>
  <a href="{{ BASE_PATH }}/a-dark-room">A Dark Room for iOS</a>
  <br style="padding: 5px"/>
  <span style="color: #767676; font-size: 12px">Official release of A Dark Room on iOS</span>
</div>

##Posts

{% for post in site.posts %}
  <div style="line-height: 13px; padding-bottom: 10px">
    <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a><br/>
    <span style="color: #767676; font-size: 12px">{{ post.date | date_to_string }}</span>
  </div>
{% endfor %}

<hr /> <!-- put next entry above this line -->

<link href="//cdn-images.mailchimp.com/embedcode/slim-081711.css" rel="stylesheet" type="text/css"/>

<div id="mc_embed_signup">
  <form action="http://amirrajan.us8.list-manage.com/subscribe/post?u=61936e0179df5da623ee7cdb7&amp;id=f44fb947df"
      method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate="novalidate">
    <label for="mce-EMAIL">Subscribe to Amir Rajan's Blog</label>

    <div>Subscribe to get high signal, low noise entries with regards to software development, doing what you love, and never being content with where you are.</div>

    <div><br/></div>

    <input type="email" value="" name="EMAIL" class="email" id="mce-EMAIL" placeholder="email address" required="required" />
    <div class="clear"><input type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="button" /> <small>powered by MailChimp</small></div>
  </form>
</div>
