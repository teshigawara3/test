#! ruby -Ku

require 'open-uri'
require 'nokogiri'

url = 'http://eiga.com/ranking/'

charset = nil

html = open(url) do |f|
	charset = f.charset
	f.read
end

doc = Nokogiri::HTML.parse(html,nil,charset)

node = doc.xpath('//div[@id ="rankBox"]//a')
node.inject({}) do |hash,title|		
	title.css('img').map do |alt|
		p alt.attribute('alt').value
	end
end
