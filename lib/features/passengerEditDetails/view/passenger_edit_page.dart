import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irctctest/core/routes_constant.dart';
import 'package:irctctest/features/passengerEditDetails/controller/passenger_edit_controller.dart';

class PassengerEditPage extends GetView<PassengerEditController>{
  const PassengerEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Passenger Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Name'),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Suraj Tiwari',
              ),
              enabled: false, // Disable the Name field
            ),
            const SizedBox(height: 16.0),
            const Text('Age'),
            TextFormField(
              decoration: const InputDecoration(
                hintText: '26',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Gender'),
            const Row(
              children: [
                Radio(value: 'Male', groupValue: null, onChanged: null), // Disable the Gender radio buttons
                Text('Male'),
                Radio(value: 'Female', groupValue: null, onChanged: null), // Disable the Gender radio buttons
                Text('Female'),
                Radio(value: 'Other', groupValue: null, onChanged: null), // Disable the Gender radio buttons
                Text('Other'),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text('Berth Preferences'),
            DropdownButton<String>(
              value: 'Lower',
              onChanged: null, // Disable the Berth Preferences dropdown
              items: <String>['Lower', 'Middle', 'Upper', 'No Preference','Side Lower','Upper Lower']
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ),
              ).toList(),
            ),
            const SizedBox(height: 16.0),
            const Text('Address Details'),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'DD Nager, Gwalior',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Mobile Number'),
            TextFormField(
              decoration: const InputDecoration(
                hintText: '1234567890',
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Get.defaultDialog(
              title: 'Success',
              content: Column(
                children: [
                  Image.asset('assets/successful.png', height: 100, width: 100), // Ensure you have a success image in assets
                  const SizedBox(height: 16),
                  const Text('Thank you, your information has been Edited'),
                ],
              ),
              confirm: ElevatedButton(
                onPressed: () {
                  Get.toNamed(RoutesConstant.home); // Close the dialog and navigate to the home route
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, // Change to your desired color
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
            // Get.toNamed(RoutesConstant.home);
            // Handle add passenger
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            backgroundColor: Colors.blue, // Text color
          ),
          child: const Text('Save'),
        ),
      ),
    );
  }

}