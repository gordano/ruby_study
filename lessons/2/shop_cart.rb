class ShopCart
  class << self
    attr_accessor :item_title, :item_price, :item_count, :items_cart

    def call
      add_cart_items
      print_cart
      calculate_total_bill
    end

    def add_cart_items
      self.items_cart = {}

      # No validations at all =(
      while true
        puts 'Item Title:'
        self.item_title = gets.chop

        break if self.item_title.eql?('stop')

        puts 'Price item:'
        self.item_price = gets.chop.to_i

        puts 'Count items:'
        self.item_count = gets.chop.to_i

        self.items_cart[self.item_title] = {
          price: self.item_price,
          count: self.item_count,
          subtotal: self.item_price * self.item_count
        }
      end
    end

    def print_cart
      puts "Your cart include items are:"
      puts self.items_cart
    end

    def calculate_total_bill
      total_bill = 0

      self.items_cart.each do |_key, value|
        total_bill += value[:subtotal]
      end

      puts "Your Total Bill is: #{total_bill}"
    end
  end
end