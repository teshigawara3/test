#! ruby -Ku

require 'open-uri'
require 'nokogiri'

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

		ms = Array.new
		node = doc.xpath('//div[@id ="rankBox"]//a')
		node.each do |title|
			title.css('img').map do |alt|
				ms.push(alt.attribute('alt').value)
			end
		end

		return ms
	end
end