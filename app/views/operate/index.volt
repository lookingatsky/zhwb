<?php use Phalcon\Tag as Tag ?>

{% for new in News %}
	{{ new.newstype.name }}
{% endfor %}