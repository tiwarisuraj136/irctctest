import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:irctctest/core/model/passenger_model.dart';

class PassengerListController extends GetxController{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<Passenger> passengers = <Passenger>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPassengers();
  }



  Future<void> fetchPassengers() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore.collection('passengers').get();

      passengers.assignAll(
        snapshot.docs.map((doc) => Passenger(
          id: doc.id,
          name: doc['name'],
          gender: doc['gender'],
          age: doc['age'],
          preference: doc['berth'], // Assuming 'berth' is stored as 'preference'
        )).toList(),
      );
    } catch (e) {
      print('Error fetching passengers: $e');
    }
  }

  void deletePassenger(int index) async {
    try {
      await _firestore.collection('passengers').doc(passengers[index].id).delete();
      passengers.removeAt(index);
    } catch (e) {
      print('Error deleting passenger: $e');
    }
  }


}



