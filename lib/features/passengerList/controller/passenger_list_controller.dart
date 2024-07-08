import 'package:get/get.dart';
import 'package:irctctest/core/model/passenger_model.dart';

class PassengerListController extends GetxController{
  var passengers = <Passenger>[
    Passenger(name: "Suraj Tiwari", gender: "Male", preference: "Middle Berth", selected: false),
    // Add other passengers here
  ].obs;

  void addPassenger(Passenger passenger) {
    passengers.add(passenger);
  }

  void deletePassenger(int index) {
    passengers.removeAt(index);
  }

  void toggleSelection(int index) {
    passengers[index].selected = !passengers[index].selected;
    passengers.refresh();
  }

  void editPassenger(int index, Passenger updatedPassenger) {
    passengers[index] = updatedPassenger;
    passengers.refresh();
  }
}