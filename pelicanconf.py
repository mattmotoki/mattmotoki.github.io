#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = 'Matt Motoki'
SITENAME = 'Matt Motoki'
SITEURL = ''

PATH = 'content'

TIMEZONE = 'Pacific/Honolulu'

DEFAULT_LANG = 'en'

NEST_HEADER_IMAGES = 'bg0.png'

NEST_CSS_MINIFY = True

NEST_INDEX_HEADER_TITLE = u"Matt Motoki's Blog"
NEST_INDEX_HEADER_SUBTITLE = u'Machine Learning Enthusiast'

MENUITEMS = [('Categories','/categories.html'),('Tags','/tags.html')]


FEED_ALL_ATOM = 'feeds/all.atom.xml'
FEED_ALL_RSS = 'feeds/all.rss.xml'
AUTHOR_FEED_RSS = 'feeds/%s.rss.xml'
RSS_FEED_SUMMARY_ONLY = False

# Feed generation is usually not desired when developing
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None

# Blogroll
LINKS = (
	('GitHub', 'https://github.com/mattmotoki/'),
    ('CodePen', 'https://codepen.io/mmotoki/'),
)

# Social widget
SOCIAL = (
	('Kaggle', 'https://www.kaggle.com/mmotoki'),
    ('LinkedIn', 'https://www.linkedin.com/in/matt-motoki-9b7884a2/'),
    
)

TWITTER_USERNAME = 'matt_motoki'

DEFAULT_PAGINATION = 10

# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True
THEME = 'themes/nest'

PLUGIN_PATHS = ['/home/matt/repos/pelican-plugins']
PLUGINS = ['render_math']

GOOGLE_ANALYTICS = 'UA-89247796-2'


