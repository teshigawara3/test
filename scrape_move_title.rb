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

	test = Array.new
	node = doc.xpath('//div[@id ="rankBox"]//a')
	nodeHash = node.inject({}) do |hash,title|
		p hash
		next hash unless title.text.empty?
		
		dataArray = title.css('img').map do |alt|
			data = alt.attribute('alt').value
		end
	keyNm = dataArray.shift
	hash[keyNm] = dataArray
	hash
	end

nodeHash.each do |key, value|
  puts "---------------------"
  puts key
  puts "---------------------"
  value.each do |data|
    puts data 
  end
end
