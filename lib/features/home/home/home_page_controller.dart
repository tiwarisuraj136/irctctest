
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:irctctest/core/model/item_model.dart';
import 'package:irctctest/core/routes_constant.dart';

class HomeController extends GetxController {


  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  var allInfo = <ItemModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    allInfo.bindStream(itemStream());
  }
  
  Stream<List<ItemModel>> itemStream(){
    return firebaseFirestore.collection('items').snapshots().map((QuerySnapshot query){
      List<ItemModel>allInfo =[];

      for(var item in query.docs){
        final itemModel = ItemModel.fromDocumentSnapshot(item);
        allInfo.add(itemModel);
      }
      return allInfo;
    });
    
  }


  Future<void> updateStatus(bool isDone, String documentId) async {
    await firebaseFirestore
        .collection('items')
        .doc(documentId)
        .update({'isDone': isDone});
  }

  Future<void> deleteHrmData(String documentId) async {
    await firebaseFirestore
        .collection('items')
        .doc(documentId)
        .delete();
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
      Get.snackbar('Success', 'Log-out successful');
      Get.toNamed(RoutesConstant.login); // Navigate to the login screen
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }



}






