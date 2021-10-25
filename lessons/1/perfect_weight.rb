class PerfectWeight
  class << self
    attr_accessor :user_height, :user_name, :user_weight_index

    def call
      ask_name
      ask_height
      show_results
    end

    protected

    def ask_name
      while name_is_not_only_letters?
        print_message(0)
        self.user_name = gets.chop
      end
    end

    def ask_height
      while height_is_not_only_digits?
        print_message(1)
        self.user_height = gets.chop
      end
    end

    def show_results
      self.user_weight_index = calculate_weight
      self.user_weight_index.positive? ? print_message(3) : print_message(2)
    end

    def height_is_not_only_digits?
      /^[0-9]*$/.match(self.user_height).nil?
    end

    def name_is_not_only_letters?
      /^[a-zA-Z]*$/.match(self.user_name).nil?
    end

    def calculate_weight
      (self.user_height.to_i - 110) * 1.15
    end

    def messages(message_index)
      case message_index
      when 0 then 'Please enter your Name (letters only):'
      when 1 then 'Please enter your Height (digits only):'
      when 2 then "---------\n Congratulations! You weight is almost perfect."
      when 3 then "---------\n #{self.user_name.capitalize} your perfect weight is: #{self.user_weight_index}"
      else 'Oops'
      end
    end

    def print_message(message_index)
      puts messages(message_index)
    end
  end
end