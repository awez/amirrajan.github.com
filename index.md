---
layout: page
title:
---
{% include JB/setup %}

I'm a ronin <a href="http://www.paulgraham.com/hp.html" target="_blank">hacker</a>, an <a href="http://amirrajan.net/games/" target="_blank">indie game developer</a>, and an <a href="http://leanpub.com/survivingtheappstore" target="_blank">author</a>.<br />

I try to better the software development craft by [**presenting**](/about/), [**blogging**]({{ HOME_PATH }}), [**contributing to open source**](http://github.com/amirrajan), [**tweeting**](http://twitter.com/amirrajan), and [**screencasts**](/screencasts/).

Notables
---

<div style="line-height: 15px; padding-bottom: 10px">
  <a href="{{ BASE_PATH }}/a-dark-room">A Dark Room for iOS</a>
  <br style="padding: 5px"/>
  <span style="color: #767676; font-size: 12px">Official release of A Dark Room on iOS</span>
</div>

<div style="line-height: 15px; padding-bottom: 10px">
  <a href="{{ BASE_PATH }}/nodejs-by-example">NodeJS by Example</a>
  <br style="padding: 5px"/>
  <span style="color: #767676; font-size: 12px">A list of NodeJS apps I've built to help you get started with the platform</span>
</div>

Posts
---

{% for post in site.posts %}
  <div style="line-height: 13px; padding-bottom: 10px">
    <a style="display: block; margin-bottom: 5px;" href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a>
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
    <div class="clear"><input type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="button" /></div>
  </form>

</div>

<b>Surviving The App Store as an Indie Game Developer</b>

I've spent the last three years fighting the uphill battle of getting noticed in the App Store. [I've decided to write some words about it in book format](http://leanpub.com/survivingtheappstore).
