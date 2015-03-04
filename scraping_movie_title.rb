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

$test=Array.new
i=0
node = doc.xpath('//div[@id ="rankBox"]//a')
#node.inject({}) do |hash,title|		
node.each do |title|
	title.css('img').map do |alt|
		#p alt.attribute('alt').value
		$test[i]=alt.attribute('alt').value
		i+=1
	end
end

