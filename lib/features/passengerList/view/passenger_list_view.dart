import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irctctest/core/routes_constant.dart';
import 'package:irctctest/features/passengerList/controller/passenger_list_controller.dart';

class PassengerListView extends GetView<PassengerListController>{
  const PassengerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Passenger Master List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount: controller.passengers.length,
                itemBuilder: (context, index) {
                  final passenger = controller.passengers[index];
                  return Card(
                  color: Colors.tealAccent,
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                passenger.name,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Checkbox(
                                value: passenger.selected,
                                onChanged: (value) {
                                  controller.toggleSelection(index);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Text('Gender: ${passenger.gender}'),
                          const SizedBox(height: 4.0),
                          Text('Preference: ${passenger.preference}'),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  Get.toNamed(RoutesConstant.editPassenger);
                                  // Handle edit
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  controller.deletePassenger(index);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(RoutesConstant.addPassenger);
            // Handle add passenger
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            backgroundColor: Colors.blue, // Text color
          ),
          child: const Text('Add Passenger'),
        ),
      ),
    );
  }

}