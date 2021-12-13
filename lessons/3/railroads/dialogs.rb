module Railroads
  module Dialogs
    DIALOG_MAIN =
      {
        methods:[
          :action_create_objects,
          :action_ask_object_do,
          :action_show_object_info,
          :action_show_all_info,
          :action_main,
          :action_exit
        ],
        texts: [
          'Создать станцию, маршрут, поезд или вагон',
          'Операцию над объектом',
          'Вывод информации объекта',
          'Просмотр всех объектов',
          'В ГЛАВНОЕ МЕНЮ',
          'EXIT'
        ]
      }

    DIALOG_CREATE_OBJECTS =
      {
        methods:[
          :action_create_station,
          :action_create_route,
          :action_create_train,
          :action_create_wagon,
          :action_main
        ],
        texts: [
          'Создать станцию',
          'Создать маршрут',
          'Создать поезд',
          'Создать вагон',
          'В ГЛАВНОЕ МЕНЮ'
        ]
      }

    DIALOG_CREATE_STATION =
      {
        texts: ['Введите название станции:']
      }

    DIALOG_CREATE_ROUTE =
      {
        texts: ['Введите номера Начальной и Конечной станций через запятую:']
      }

    DIALOG_CREATE_TRAIN =
      {
        texts: [
          "Тип 1-Пассажирский\nТип 2-Грузовой\nВведите номер типа поезда, и название поезда через запятую:"]
      }

    DIALOG_CREATE_WAGON =
      {
        texts: [
          "Тип 1-Пассажирский\nТип 2-Грузовой\nВведите номер типа вагона:"]
      }

    DIALOG_METHODS_OBJECTS =
      {
        methods:[
          :action_add_station_to_route,
          :action_remove_station_from_route,
          :action_add_route_to_train,
          :action_add_wagon_to_train,
          :action_remove_wagon_from_train,
          :action_move_train,
          :action_main
        ],
        texts: [
          'Добавить станцию к маршруту',
          'Удалить станцию из маршрута',
          'Назначить маршрут поезду',
          'Прицепить вагон к поезду',
          'Отцепить вагон от поезда',
          'Отправить поезд вперёд или назад',
          'В ГЛАВНОЕ МЕНЮ'
        ]
      }

    DIALOG_ADD_STATION_TO_ROUTE =
      {
        texts: [
          "Введите номер маршрута и номер станции через зяпятую:"]
      }

    DIALOG_REMOVE_STATION_FROM_ROUTE =
      {
        texts: [
          "Введите номер маршрута и номер станции через зяпятую:"]
      }

    DIALOG_ADD_ROUTE_TO_TRAIN =
      {
        texts: [
          "Введите номер поезда и номер маршрута через зяпятую:"]
      }

    DIALOG_ADD_WAGON_TO_TRAIN =
      {
        texts: [
          "Введите номер поезда и номер вагона через зяпятую:"]
      }

    DIALOG_REMOVE_WAGON_FROM_TRAIN =
      {
        texts: [
          "Введите номер вагона:"]
      }

    DIALOG_ACTION_MOVE_TRAIN =
      {
        texts: [
          "Введите номер поезда и через запятую направление(1-вперёд, 0-назад):"]
      }

    DIALOG_SHOW_OBJECT_INFO =
      {
        methods:[
          :action_show_trains_on_station,
          :action_main
        ],
        texts: [
          'Посмотреть список поездов на станции',
          'В ГЛАВНОЕ МЕНЮ'
        ]
      }

    DIALOG_SHOW_TRAINS_ON_STATION =
      {
        texts: [
          "Введите номер станции:"]
      }
  end
end