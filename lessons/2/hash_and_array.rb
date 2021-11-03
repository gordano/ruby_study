class HashAndArray
  class << self

    MONTH_DAYS = {
      'jan': 31,
      'feb': 28,
      'mar': 31,
      'apr': 30,
      'may': 31,
      'june':	30,
      'july':	31,
      'aug': 31,
      'sept':	30,
      'oct': 31,
      'nov': 30,
      'dec': 31
    }

    def call
      show_months_with_30_days
      show_range_with_step_5
      show_fibonacci_sequence
      show_vowel_number
    end

    def show_months_with_30_days
      puts "Months with 30 days are: #{MONTH_DAYS.select {|key, value| value == 30}.keys}\n\n"
    end

    def show_range_with_step_5
      my_array = []
      (10..100).step(5){|number| my_array << number}

      puts "Range from 10 to 100 with step 5 is: #{my_array}\n\n"
    end

    def show_fibonacci_sequence
      fibonacci_sequence = [1,1]

      while true
        new_item = fibonacci_sequence[-1] + fibonacci_sequence[-2]
        break if new_item >= 100
        fibonacci_sequence << new_item
      end

      puts "Fibonacci sequence lower then 100 is: #{fibonacci_sequence}\n\n"
    end

    def show_vowel_number
      english_alphabet = ('a'..'z').to_a
      english_vowels = %w(a e i o u y)
      vowels_hash = {}

      english_alphabet.each_with_index do |letter, index|
        vowels_hash[letter] = index + 1 if english_vowels.include?(letter)
      end

      puts "English vowels with number hash is #{vowels_hash})"
    end
  end
end