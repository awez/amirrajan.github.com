---
layout: page
title:
---
{% include JB/setup %}

I'm just a guy trying to figure out why in the world I have a such a passion for development. Through my struggles with the human condition, I share my little blip of an existance through [presenting](/about/), [this blog]({{ HOME_PATH }}), [github](http://github.com/amirrajan), and [twitter](http://twitter.com/amirrajan).

##Posts
<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
