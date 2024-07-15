import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class SearchTrainController extends GetxController {
  var fromStation = ''.obs;
  var toStation = ''.obs;
  var selectedDate = DateTime.now().obs;
  var selectedClass = 'Sleeper'.obs; // Default initial value
  var selectedQuota = 'General'.obs; // Default initial value

  var photo = Rx<File?>(null);
  final ImagePicker picker = ImagePicker();

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

  Future imgFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      photo.value = File(pickedFile.path);
      uploadFile();
    } else {
      Get.snackbar('Error', 'No image selected.');
    }
  }

  Future imgFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      photo.value = File(pickedFile.path);
      uploadFile();
    } else {
      Get.snackbar('Error', 'No image selected.');
    }
  }

  Future uploadFile() async {
    print('hello i want photo93');
    print(photo.value);
    print('hello i want photo');
    if (photo.value == null) return;
    final fileName = basename(photo.value!.path);
    final destination = 'files/$fileName';
print('destination99');
print(destination);
print('destination101');
    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(photo.value!);
      Get.snackbar('Success', 'File uploaded successfully.');
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while uploading the file.');
    }
  }
}
