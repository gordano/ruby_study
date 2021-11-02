class DayYearCount
  class << self
    attr_accessor :day_input, :month_input, :year_input

    MONTH_DAYS = {
      1 => 31,
      2 => [28,29],
      3 => 31,
      4 => 30,
      5 => 31,
      6 => 30,
      7 => 31,
      8 => 31,
      9 => 30,
      10 => 31,
      11 => 30,
      12 => 31
    }


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
      MONTH_DAYS[2] = self.year_input % 4 == 0 ? MONTH_DAYS[2][-1] : MONTH_DAYS[2][0]

      day_in_year_count = self.day_input

      MONTH_DAYS.each do |month, days|
        break if month >=  self.month_input

        day_in_year_count += days
      end

      puts "There are #{day_in_year_count} from start of your year"
    end
  end
end