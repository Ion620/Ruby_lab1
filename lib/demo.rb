require_relative 'parser'
require_relative '../app/models/cart'
require_relative '../app/models/item'
require_relative '../app/models/main_application'
# URL для парсингу
url = 'https://glovoapp.com/ua/uk/chernivtsi/lviv-croissants-chn/'

item_data = Parser.parse_item(url)

items_array = item_data[:name].split("\n")
items_array.reject!(&:empty?)
descriptions = item_data[:description].split("\n").reject(&:empty?)
prices = item_data[:price].split("\n").reject(&:empty?)
categories = item_data[:category].split("\n").reject(&:empty?)


items = []
min_length = [items_array.length, descriptions.length, prices.length, categories.length].min
(0...min_length).each do |index|
  item_info = {
    name: items_array[index]&.strip,
    description: descriptions[index]&.strip,
    price: prices[index]&.strip,
    category: categories[index]&.strip
  }
  items << item_info.compact # Видаляємо `nil` елементи з хешу
end

# Додавання товарів до кошика
cart = Cart.new
items.each do |item_info|
  cart.add_new_item(item_info[:name], item_info[:description], item_info[:price], item_info[:category])
end

#item = Item.new(item_data[:name], item_data[:description], item_data[:price], item_data[:category])

# cart = Cart.new
# cart.add_item(item)

cart.save_to_file('items.txt')
cart.save_to_json('items.json')
cart.save_to_csv('items.csv')
