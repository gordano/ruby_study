module Railroads
  module Helpers
    def show_object_title_in(rail_object)
      rail_object.each_with_index do |item, index|
        puts "Номер #{index.next}, #{item.title}"
      end
    end

    def show_menu_text(dialog_menu)
      if dialog_menu.size.eql? 1
        puts dialog_menu.first
      else
        dialog_menu.each_with_index do |text, index|
          puts "Введите #{index.next}, #{text}"
        end
      end
    end

    def get_answer(dialog)
      show_menu_text(dialog[:texts])
      gets.chop
    end
  end
end