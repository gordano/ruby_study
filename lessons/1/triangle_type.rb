class TriangleType
  class << self
    attr_accessor :triangle_data, :transform_triangle_data

    def call
      set_initial_data_sides
      ask_sides_value
      sort_sides_values
      show_type_of_triangle
    end

    protected

    def set_initial_data_sides
      self.triangle_data = {a_side: nil, b_side: nil, c_side: nil}
    end

    def ask_sides_value
      self.triangle_data.each_key do |side_key|
        while is_not_valid_data?(self.triangle_data[side_key])
          print_message(side_key)
          self.triangle_data[side_key] = gets.chop
        end
      end
    end

    def transform_triangle_data
      self.transform_triangle_data ||= self.triangle_data.map {|_key,value| value.to_f}.sort
    end

    def show_type_of_triangle
      return print_message(0) if self.transform_triangle_data.uniq.size.eql? 2
      return print_message(1) if self.transform_triangle_data.uniq.size.eql? 1
      return print_message(2) if is_right_triangle?

      print_message(3)
    end

    def is_right_triangle?
      # for test: [6,8,10]
      self.transform_triangle_data[2] == Math.sqrt(self.transform_triangle_data[0]**2 + self.transform_triangle_data[1]**2)
    end

    def is_not_valid_data?(user_answer)
      value_is_not_only_digits?(user_answer) || value_is_negative_or_zero?(user_answer)
    end

    def value_is_not_only_digits?(user_answer)
      /^[0-9]*$/.match(user_answer).nil?
    end

    def value_is_negative_or_zero?(user_answer)
      user_answer.to_i <= 0
    end

    def messages(message_index)
      case message_index
      when 0 then "---------\n It's a Isosceles Triangle"
      when 1 then "---------\n It's a Equilateral Triangle"
      when 2 then "---------\n It's a Right Triangle"
      when 3 then "---------\n It's a Simple Triangle"
      else "Please enter your #{message_index} (positive digits only):"
      end
    end

    def print_message(message_index)
      puts messages(message_index)
    end
  end
end