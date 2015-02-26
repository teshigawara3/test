#! ruby -Ku

require 'open-uri'
require 'nokogiri'

#url = 'http://www.yahoo.co.jp/'
url = 'http://eiga.com/ranking/'

charset = nil

html = open(url) do |f|
	charset = f.charset
	f.read
end

doc = Nokogiri::HTML.parse(html,nil,charset)

#p doc.title

#doc.xpath('//div[@id ="rankBox"]').each do |rank|
#doc.xpath('//div[@id ="rankBox"]').map do |rank|
#	p rank.css('a').inner_text
#	$title = rank.css('a').inner_text
#end

	node = doc.xpath('//div[@id ="rankBox"]//a').text()
	dataarray = node.css('a').map do |a|
		data = a.text.gsub(/[\u00A0\n]/, '').strip
	end
	p data[1]
		#	p node.length
#	p node[1]
#	p node[2]
#page = Nokogiri::HTML(open('http://eiga.com/ranking/'))
#p page.css("rankBox")[0].text

#p $title[0]
#p $title[1]
#p $title.length

