import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPassengerController extends GetxController{
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();

  String selectedGender = '';
  String selectedBerth = 'No Preference'; // Default value

  Future<void> addPassenger(String name, int age, String gender, String berth, String address, String mobileNumber) async {
    try {
      await firestore.collection('passengers').add({
        'name': name,
        'age': age,
        'gender': gender,
        'berth': berth,
        'address': address,
        'mobileNumber': mobileNumber,
      });
    } catch (e) {
      print('Error adding passenger: $e');
    }
  }
}