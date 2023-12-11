require_relative 'item_container'
require 'csv'
class Cart
  include ItemContainer

  def initialize
    @items = []
  end

  def save_to_file(file_name)
    File.open(file_name, 'w') do |file|
      @items.each do |item|
        file.puts("#{item.name}, #{item.description}, #{item.price}, #{item.category}")
      end
    end
  end

  def save_to_json(file_name)
    File.open(file_name, 'w') do |file|
      json_data = @items.map(&:to_json)
      file.puts(json_data)
    end
  end

  def save_to_csv(file_name)
    CSV.open(file_name, 'w') do |csv|
      @items.each do |item|
        csv << item.to_array_for_csv.join(';').gsub(/;+$/, '').split(',')
      end
    end
  end
end
