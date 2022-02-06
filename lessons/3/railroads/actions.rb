module Railroads
  module Actions
    def action_main
      loop do
        dialog = load_constant "DIALOG_MAIN"
        answer = get_answer(dialog).to_i

        break if send(dialog[:methods][answer.pred]).eql?('EXIT')
      end
    end

    def action_to_main
      #DO NOTHING
    end

    def action_create_objects
      dialog = load_constant "DIALOG_CREATE_OBJECTS"
      answer = get_answer(dialog).to_i
      send dialog[:methods][answer.pred]
    end

    def action_create_station
      dialog = load_constant "DIALOG_CREATE_STATION"
      answer = get_answer(dialog)
      create_station(answer)
    end

    def action_create_route
      dialog = load_constant "DIALOG_CREATE_ROUTE"
      show_object_title_in(stations)

      answer = get_answer(dialog)
      create_route(answer)
    end

    def action_create_train
      dialog = load_constant "DIALOG_CREATE_TRAIN"
      answer = get_answer(dialog)
      create_train(answer)
    end

    def action_create_wagon
      dialog = load_constant "DIALOG_CREATE_WAGON"
      answer = get_answer(dialog)
      create_wagon(answer)
    end

    def action_ask_object_do
      dialog = load_constant "DIALOG_METHODS_OBJECTS"
      answer = get_answer(dialog).to_i
      send dialog[:methods][answer.pred]
    end

    def action_add_station_to_route
      dialog = load_constant "DIALOG_ADD_STATION_TO_ROUTE"
      puts 'Маршруты:'
      show_object_title_in(routes)
      puts 'Станции:'
      show_object_title_in(stations)

      answer = get_answer(dialog)
      add_station_to_route(answer)
    end

    def action_remove_station_from_route
      dialog = load_constant "DIALOG_REMOVE_STATION_FROM_ROUTE"
      puts 'Маршруты:'
      show_object_title_in(routes)
      puts 'Станции:'
      show_object_title_in(stations)

      answer = get_answer(dialog)
      remove_station_to_route(answer)
    end

    def action_add_route_to_train
      dialog = load_constant "DIALOG_ADD_ROUTE_TO_TRAIN"
      puts 'Поезда:'
      show_object_title_in(trains)
      puts 'Маршруты:'
      show_object_title_in(routes)

      answer = get_answer(dialog)
      add_route_to_train(answer)
    end

    def action_add_wagon_to_train
      dialog = load_constant "DIALOG_ADD_WAGON_TO_TRAIN"
      puts 'Поезда:'
      show_object_title_in(trains)
      puts 'Вагоны:'
      show_object_title_in(wagons.select{|wagon| wagon.train.nil?})

      answer = get_answer(dialog)
      add_wagon_to_train(answer)
    end

    def action_remove_wagon_from_train
      dialog = load_constant "DIALOG_REMOVE_WAGON_FROM_TRAIN"
      puts 'Вагоны:'
      show_object_title_in(wagons.select{|wagon| !wagon.train.nil?})

      answer = get_answer(dialog)
      remove_wagon_from_train(answer)
    end

    def action_move_train
      dialog = load_constant "DIALOG_ACTION_MOVE_TRAIN"
      puts 'Поезда:'
      show_object_title_in(trains.select{|train| !train.route.nil?})

      answer = get_answer(dialog)
      move_train(answer)
    end

    def action_show_object_info
      dialog = load_constant "DIALOG_SHOW_OBJECT_INFO"
      puts 'action_show_object_info'
      answer = get_answer(dialog).to_i
      send dialog[:methods][answer.pred]
    end

    def action_show_trains_on_station
      dialog = load_constant "DIALOG_SHOW_TRAINS_ON_STATION"
      puts 'action_show_trains_on_station'
      show_object_title_in(stations)

      answer = get_answer(dialog)
      show_trains_on_station(answer)
    end

    def action_exit
      puts "---------- Goodbye ----------"
      'EXIT'
    end

    def load_constant(dialog)
      Object.const_get "Railroads::Dialogs::#{dialog}"
    end
  end
end