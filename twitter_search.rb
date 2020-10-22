#!/bin/env ruby
#encoding:UTF-8
require "twitter"

#OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

client = Twitter::REST::Client.new do |config|
  config.consumer_key       = "XXXXXXXXXXXXXXXXXXXX"
  config.consumer_secret    = "XXXXXXXXXXXXXXXXXXXX"
  config.access_token        = "XXXXXXXXXXXXXXXXXXXX"
  config.access_token_secret = "XXXXXXXXXXXXXXXXXXXX"
end

msList = ScrapingMovie.new.GetMovies()

#msList.each do |movietitle|
#	p movietitle
#end

#twt ="from:teshi321 sample"
msList.each do |movietitle|
	str='from:teshi321 ' << movietitle
#	client.search(movietitle, :result_type => "recent").take(1).collect do |tweet| "#{tweet.user.screen_name}:#{tweet.text}"
	client.search(str, :result_type => "recent").take(1).collect do |tweet| "#{tweet.user.screen_name}:#{tweet.text}"

	puts tweet.text
	end
end

