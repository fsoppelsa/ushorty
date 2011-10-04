Welcome to Ushorty
==================

Ushorty is a simple Rails 3.1 application which aim is to provide URL link
shortening feature. Through its web interface you can shorten a long URL
http://thelink.com/?variable=45&parameter=foo and get a twitterish new
short URL http://myco.co/y3Bdzs. You type http://myco.co/y3Bdzs and you
are redirected to your fancy http://thelink.com/?variable=45&parameter=foo

Bug reports and feature requests:  
https://github.com/fsoppelsa/ushorty

Getting started
===============

Clone the project and edit `config/environments/production.rb`

Find and set the following configuration directive according to your **ServerName**

	# Host
	config.server_name = { :host => 'localhost:3000' }

If you want, you can specify the hash length as well (default 6 chars):

	# Hash length
	config.hash_length = 6


New ideas
---------
* IP logging
* Get statistics
* Put time limits for generated URL
