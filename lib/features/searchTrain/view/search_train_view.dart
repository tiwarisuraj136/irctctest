import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irctctest/features/searchTrain/controller/search_train_controller.dart';

class SearchTrainView extends GetView<SearchTrainController> {
  const SearchTrainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/logo3.png'), // Replace with your logo asset
        ),
        title: const Text('Rail Connect'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification icon press
            },
          ),
          Image.asset('assets/logo.jpg')
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.fromController,
                    readOnly: true,
                    onTap: () => _showCitySelectionSheet(context, true),
                    decoration: const InputDecoration(
                      labelText: 'From',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.arrow_forward),
                ),
                Expanded(
                  child: TextField(
                    controller: controller.toController,
                    readOnly: true,
                    onTap: () => _showCitySelectionSheet(context, false),
                    decoration: const InputDecoration(
                      labelText: 'To',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: controller.dateController,
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  controller.updateTravelDate(pickedDate);
                }
              },
              decoration: const InputDecoration(
                labelText: 'Travel Date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            Obx(() => DropdownButtonFormField<String>(
              value: controller.selectedClass.value,
              onChanged: (value) {
                if (value != null) {
                  controller.updateSelectedClass(value);
                }
              },
              items: controller.trainClasses.map((String classType) {
                return DropdownMenuItem<String>(
                  value: classType,
                  child: Text(classType),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Class',
                border: OutlineInputBorder(),
              ),
            )),
            const SizedBox(height: 16.0),
            Obx(() => DropdownButtonFormField<String>(
              value: controller.selectedQuota.value,
              onChanged: (value) {
                if (value != null) {
                  controller.updateSelectedQuota(value);
                }
              },
              items: controller.quotas.map((String quota) {
                return DropdownMenuItem<String>(
                  value: quota,
                  child: Text(quota),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Quota',
                border: OutlineInputBorder(),
              ),
            )),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                controller.searchTrains();
              },
              child: const Text('Search Train'),
            ),
            const SizedBox(height: 16.0),
            Obx(() {
              if (controller.searchResult.isNotEmpty) {
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('From: ${controller.searchResult['fromStation']}'),
                        Text('To: ${controller.searchResult['toStation']}'),
                        Text('Travel Date: ${controller.searchResult['travelDate']}'),
                        Text('Class: ${controller.searchResult['class']}'),
                        Text('Quota: ${controller.searchResult['quota']}'),
                      ],
                    ),
                  ),
                );
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
    );
  }

  void _showCitySelectionSheet(BuildContext context, bool isFrom) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 250,
          child: ListView.builder(
            itemCount: controller.cities.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.cities[index]),
                onTap: () {
                  if (isFrom) {
                    controller.updateFromStation(controller.cities[index]);
                  } else {
                    controller.updateToStation(controller.cities[index]);
                  }
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }
}


