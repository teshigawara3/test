#!/bin/env ruby
#encoding:UTF-8
require "twitter"

#OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

client = Twitter::REST::Client.new do |config|
  config.consumer_key       = "F4CePTFDSzzNPWy1gtroWt0uG"
  config.consumer_secret    = "ujQjfMYDiAreIT9z3m1JKmci1s0FgIDKwo8pJzoRpEqw1g2s0U"
  config.access_token        = "1407219055-1ZlToB4NmTRs8Wcl9FUZfbH6sWJMFKNhaVV3FPD"
  config.access_token_secret = "olA7RsVeSOjXO1Z6ULBodJaI6OhsLMAu0FNm4nIkn7x0l"
end

#client.update("test2")
	twt ="from:teshi321 sample"
	a = "sample"
	puts a
	client.search(twt, :result_type => "recent").take(1).collect do |tweet| "#{tweet.user.screen_name}:#{tweet.text}"
	puts tweet.text
	end
	#client.search("It Girl",:result_type=>"recent").take(1).each do |tweet|
	#puts tweet.text
	#end
	#rescue Twitter::Error => error
	#p error
#end

