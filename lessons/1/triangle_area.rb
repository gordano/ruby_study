class TriangleArea
  class << self
    attr_accessor :triangle_base, :triangle_height, :triangle_area

    def call
      ask_base
      ask_height
      show_results
    end

    protected

    def ask_base
      while should_be_only_digits(self.triangle_base) || should_be_positive(self.triangle_base)
        print_message(0)
        self.triangle_base = gets.chop
      end
    end

    def ask_height
      while should_be_only_digits(self.triangle_height) || should_be_positive(self.triangle_height)
        print_message(1)
        self.triangle_height = gets.chop
      end
    end

    def show_results
      self.triangle_area = calculate_triangle_area
      print_message(2)
    end

    def should_be_only_digits(user_asnwer)
      /^[0-9]*$/.match(user_asnwer).nil?
    end

    def should_be_positive(user_asnwer)
      user_asnwer.to_i <= 0
    end

    def calculate_triangle_area
      0.5 * self.triangle_base.to_i * self.triangle_height.to_i
    end

    def messages(message_index)
      case message_index
      when 0 then 'Please enter your Triangle Base (positive digits only):'
      when 1 then 'Please enter your Triangle Height (positive digits only):'
      when 2 then "---------\n Triangle Area is: #{self.triangle_area}"
      else 'Oops'
      end
    end

    def print_message(message_index)
      puts messages(message_index)
    end
  end
end