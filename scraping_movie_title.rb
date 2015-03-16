#! ruby -Ku

require 'open-uri'
require 'nokogiri'
require './movie'
require './MovieList'

class ScrapingMovie	

	def initialize
		@url = 'http://eiga.com/ranking/'
	end

	def GetMovies		
		charset = nil
		html = open(@url) do |f|
			charset = f.charset	
			f.read
		end

		doc = Nokogiri::HTML.parse(html,nil,charset)
		msList=MovieList.new
		#ms = Array.new
		node = doc.xpath('//div[@id ="rankBox"]//a')
		node.each do |title|
			title.css('img').map do |alt|
				#ms.push(alt.attribute('alt').value)
				ms = Movie.new(alt.attribute('alt').value)
				msList.push(ms)
			end
		end

		return msList
	end
end
