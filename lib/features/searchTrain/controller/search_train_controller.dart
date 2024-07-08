import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class SearchTrainController extends GetxController {
  var fromStation = ''.obs;
  var toStation = ''.obs;
  var selectedDate = DateTime.now().obs;
  var selectedClass = 'Sleeper'.obs; // Default initial value
  var selectedQuota = 'General'.obs; // Default initial value

  TextEditingController dateController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  List<String> trainClasses = ['Sleeper', 'AC 3 Tier', 'AC 2 Tier', 'First Class'];
  List<String> quotas = ['General', 'Tatkal', 'Ladies', 'Senior Citizen'];
  List<String> cities = ['Gwalior', 'Bhopal', 'Bengaluru', 'Surat', 'New Delhi'];

  var searchResult = {}.obs;

  void updateFromStation(String value) {
    fromStation.value = value;
    fromController.text = value;
  }

  void updateToStation(String value) {
    toStation.value = value;
    toController.text = value;
  }

  void updateTravelDate(DateTime date) {
    selectedDate.value = date;
    dateController.text = DateFormat('yyyy-MM-dd').format(date);
  }

  void updateSelectedClass(String classType) {
    selectedClass.value = classType;
  }

  void updateSelectedQuota(String quota) {
    selectedQuota.value = quota;
  }

  void searchTrains() {
    if (fromStation.isNotEmpty && toStation.isNotEmpty && dateController.text.isNotEmpty) {
      searchResult.value = {
        'fromStation': fromStation.value,
        'toStation': toStation.value,
        'travelDate': dateController.text,
        'class': selectedClass.value,
        'quota': selectedQuota.value
      };
    } else {
      Get.snackbar('Error', 'Please fill in all fields');
    }
  }
}
