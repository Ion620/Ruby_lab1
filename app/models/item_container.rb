module ItemContainer
    module ClassMethods
    end
  
    module InstanceMethods
      def add_item(item)
        @items ||= []
        @items << item
      end
  
      def add_new_item(name, description, price, category)
        item = Item.new(name, description, price, category)
        add_item(item)
      end
      
      def remove_item(item)
        @items.delete(item)
      end
  
      def delete_items
        @items = []
      end
  
      def show_all_items
        @items.each { |item| puts item }
      end
  
      def method_missing(method_name, *args)
        puts "Метод #{method_name} не знайдено."
      end
    end
  
    def self.included(class_instance)
      class_instance.extend(ClassMethods)
      class_instance.include(InstanceMethods)
    end
  end