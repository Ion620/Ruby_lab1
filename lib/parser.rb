require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Parser
  def self.parse_item(url)
    html = URI.open(url)
    doc = Nokogiri::HTML(html)
    
    item_name = doc.css('.product-row__name').text
    item_description = doc.css('.product-row__info__description').text
    item_price = doc.css('.product-price').text
    item_category = doc.css('.list__title').text
    item_image = doc.css('.product-row__image').text
    
    { name: item_name, description: item_description, price: item_price, category: item_category }
  end
end
