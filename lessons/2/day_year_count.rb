class DayYearCount
  class << self
    attr_accessor :day_input, :month_input, :year_input

    MONTH_DAYS = [31, [28,29], 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

    def call
      ask_day_month_year
      show_day_count
    end

    def ask_day_month_year
      # No validations at all =(
      puts 'Please Enter Day:'
      self.day_input = gets.chop.to_i

      puts 'Please Enter Month:'
      self.month_input = gets.chop.to_i

      puts 'Please Enter Year:'
      self.year_input = gets.chop.to_i
    end


    def show_day_count
      #leap year check
      MONTH_DAYS[1] = self.year_input % 4 == 0 ? MONTH_DAYS[1][-1] : MONTH_DAYS[1][0]

      day_in_year_count = MONTH_DAYS.take(self.month_input-1).sum + self.day_input

      puts "There are #{day_in_year_count} from start of your year"
    end
  end
end
