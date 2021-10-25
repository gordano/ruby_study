class QuadraticEquation
  class << self
    attr_accessor :equation_data, :discriminant, :a, :b, :c, :square_roots

    def call
      set_initial_data
      ask_equation_values
      calculate_discriminant
      show_result
    end

    protected

    def set_initial_data
      self.equation_data = {a: nil, b: nil, c: nil}
    end

    def ask_equation_values
      self.equation_data.each_key do |equation_variable_key|
        while is_not_valid_data?(self.equation_data[equation_variable_key])
          print_message(equation_variable_key)
          self.equation_data[equation_variable_key] = gets.chop
        end
      end
    end

    def calculate_discriminant
      self.equation_data = self.equation_data.each {|k,v| self.equation_data[k] = v.to_f}

      self.a = self.equation_data[:a]
      self.b = self.equation_data[:b]
      self.c = self.equation_data[:c]

      self.discriminant = self.b**2 - (4 * self.a * self.c)
    end

    def show_result
      return print_message(0) if self.discriminant < 0

      print_message(1)
    end

    def square_roots
      x1 = ((-1 * self.b) + Math.sqrt(self.discriminant))/ 2 * self.a
      x2 = ((-1 * self.b) - Math.sqrt(self.discriminant))/ 2 * self.a

      self.square_roots = [x1, x2]
    end

    def is_not_valid_data?(user_answer)
      value_is_not_only_digits?(user_answer)
    end

    def value_is_not_only_digits?(user_answer)
      /^[0-9]*$/.match(user_answer).nil?
    end

    def value_is_negative_or_zero?(user_answer)
      user_answer.to_i <= 0
    end

    def messages(message_index)
      case message_index
      when 0 then "---------\n No Square root at all"
      when 1 then "---------\n Square roots are: #{self.square_roots.uniq.join(' ,')}"
      else "Please enter value for variable: #{message_index} (digits only)"
      end
    end

    def print_message(message_index)
      puts messages(message_index)
    end
  end
end