import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irctctest/core/routes_constant.dart';
import 'package:irctctest/features/addPassenger/controller/add_passenger_controller.dart';

class AddPassengerView extends GetView<AddPassengerController> {
  const AddPassengerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Passenger Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Name'),
            TextFormField(
              controller: controller.nameController,
              decoration: const InputDecoration(
                hintText: 'Enter Name',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Age'),
            TextFormField(
              controller: controller.ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter Age',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Gender'),
            Row(
              children: [
                Radio<String>(
                  value: 'Male',
                  groupValue: controller.selectedGender,
                  onChanged: (value) {

                    controller.selectedGender = value!;

                  },
                ),
                const Text('Male'),
                Radio<String>(
                  value: 'Female',
                  groupValue: controller.selectedGender,
                  onChanged: (value) {

                    controller.selectedGender = value!;

                  },
                ),
                const Text('Female'),
                Radio<String>(
                  value: 'Other',
                  groupValue: controller.selectedGender,
                  onChanged: (value) {

                    controller.selectedGender = value!;

                  },
                ),
                const Text('Other'),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text('Berth Preferences'),
            DropdownButton<String>(
              value: controller.selectedBerth,
              onChanged: (String? newValue) {

                controller.selectedBerth = newValue!;

              },
              items: <String>['Lower', 'Middle', 'Upper', 'No Preference', 'Side Lower', 'Upper Lower']
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ),
              )
                  .toList(),
            ),
            const SizedBox(height: 16.0),
            const Text('Address Details'),
            TextFormField(
              controller: controller.addressController,
              decoration: const InputDecoration(
                hintText: 'Enter Address',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Mobile Number'),
            TextFormField(
              controller: controller.mobileNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: 'Enter Mobile Number',
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            String name = controller.nameController.text.trim();
            int age = int.tryParse(controller.ageController.text.trim()) ?? 0;
            String address = controller.addressController.text.trim();
            String mobileNumber = controller.mobileNumberController.text.trim();

            if (name.isNotEmpty && age > 0 && controller.selectedGender.isNotEmpty && controller.selectedBerth.isNotEmpty && address.isNotEmpty && mobileNumber.isNotEmpty) {
              controller.addPassenger(name, age, controller.selectedGender, controller.selectedBerth, address, mobileNumber);

              Get.defaultDialog(
                title: 'Success',
                content: Column(
                  children: [
                    Image.asset('assets/successful.png', height: 100, width: 100), // Ensure you have a success image in assets
                    const SizedBox(height: 16),
                    const Text('Thank you, your information has been saved'),
                  ],
                ),
                confirm: ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(RoutesConstant.home); // Close the dialog and navigate to the home route
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
            } else {
              // Handle validation error or incomplete fields
              Get.snackbar(
                'Error',
                'Please fill in all fields.',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            backgroundColor: Colors.blue,
          ),
          child: const Text('Book'),
        ),
      ),
    );
  }

}
