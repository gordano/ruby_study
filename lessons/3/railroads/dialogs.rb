module Railroads
  module Dialogs
    DIALOG_MAIN =
      {
        methods:[
          :action_create_objects,
          :action_ask_object_do,
          :action_show_object_info,
          :action_exit
        ],
        texts: [
          'Create a station, route, train or wagon',
          'Operation on an object',
          'Object information display',
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
          :action_to_main
        ],
        texts: [
          'Create station',
          'Create route',
          'Create a train',
          'Create wagon',
          'TO MAIN MENU'
        ]
      }

    DIALOG_CREATE_STATION =
      {
        texts: ['Enter station name:']
      }

    DIALOG_CREATE_ROUTE =
      {
        texts: ['Enter numbers of Start and End stations separated by commas:']
      }

    DIALOG_CREATE_TRAIN =
      {
        texts: [
          "Type 1-Passenger\nType 2-Freight\nEnter the train type number, and the train name separated by commas:"]
      }

    DIALOG_CREATE_WAGON =
      {
        texts: [
          "Type 1-Passenger\nType 2-Freight\nEnter wagon type number:"]
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
          :action_to_main
        ],
        texts: [
          'Add station to route',
          'Remove station from route',
          'Assign route to train',
          'Hitch the wagon to the train',
          'Unhook the car from the train',
          'Send the train forward or backward',
          'TO MAIN MENU'
        ]
      }

    DIALOG_ADD_STATION_TO_ROUTE =
      {
        texts: [
          "Enter route number and station number separated by a comma:"]
      }

    DIALOG_REMOVE_STATION_FROM_ROUTE =
      {
        texts: [
          "Enter route number and station number separated by a comma:"]
      }

    DIALOG_ADD_ROUTE_TO_TRAIN =
      {
        texts: [
          "Enter train number and route number separated by a comma:"]
      }

    DIALOG_ADD_WAGON_TO_TRAIN =
      {
        texts: [
          "Enter train number and carriage number separated by a comma:"]
      }

    DIALOG_REMOVE_WAGON_FROM_TRAIN =
      {
        texts: [
          "Enter car number:"]
      }

    DIALOG_ACTION_MOVE_TRAIN =
      {
        texts: [
          "Enter train number and direction separated by commas (1-forward, 0-backward):"]
      }

    DIALOG_SHOW_OBJECT_INFO =
      {
        methods:[
          :action_show_trains_on_station,
          :action_to_main
        ],
        texts: [
          'View the list of trains at the station',
          'TO MAIN MENU'
        ]
      }

    DIALOG_SHOW_TRAINS_ON_STATION =
      {
        texts: [
          "Enter station number:"]
      }
  end
end