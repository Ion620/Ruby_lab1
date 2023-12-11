class Item
    attr_accessor :name, :description, :price, :category
  
    def initialize(name, description, price, category)
      @name = name
      @description = description
      @price = price
      @category = category
    end
  
    def info(&block)
        block.call(name, description, price, category) if block_given?
    end
  
    def to_s
        "Name: #{@name}, Description: #{@description}, Price: #{@price}, Category: #{@category}"
    end
  
    def to_h
        {
        name: @name,
        description: @description,
        price: @price,
        category: @category
        }
    end
    
    def to_array_for_csv
        [@name, @description, @price, @category]
    end

    def to_json
        {
        name: @name,
        description: @description,
        price: @price,
        category: @category
        }
    end
  end
  