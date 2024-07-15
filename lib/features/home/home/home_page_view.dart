import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irctctest/core/bottom_navigatoin_bar.dart';
import 'package:irctctest/core/other_service_card.dart';
import 'package:irctctest/core/routes_constant.dart';
import 'package:irctctest/core/train_service_card.dart';
import 'package:irctctest/core/utils.dart';
import 'home_page_controller.dart';

class HomePageView extends GetView<HomeController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure the controller is initialized

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Handle logout action
              controller.signOut();
              print("User logged out");
            },
          ),
        ],
      ),

      body: Stack(
        children: [
          Container(
            color: Colors.tealAccent,
            child: Image.asset(
              "assets/img/home_bg.png",
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: setWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: setHeight(AppBar().preferredSize.height + 30)),
                  Padding(
                    padding: EdgeInsets.only(left: setWidth(21)),
                    child: Text(
                      "Train services",
                      style: TextStyle(
                        color: const Color(0xFFA5A5A5),
                        fontWeight: FontWeight.w500,
                        fontSize: setHeight(21),
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  SizedBox(height: setHeight(14)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(RoutesConstant.searchTrain);
                        },
                        child: const TrainServiceCardWidget(
                          imgPath: "assets/img/train.png",
                          imgColor: Colors.cyan,
                          title: "Train",
                          description: "Search your next train",
                          cardColor: Colors.teal,
                          textColor: Colors.black,
                        ),
                      ),
                      SizedBox(width: setWidth(14)),
                      const TrainServiceCardWidget(
                        imgPath: "assets/img/food.png",
                        imgColor: Colors.cyan,
                        title: "Food",
                        description: "Food delivery at your seat",
                        cardColor: Colors.teal,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: setHeight(14)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          print("helloaddpassenger");
                          Get.toNamed(RoutesConstant.passengerList);
                        },
                        child: const TrainServiceCardWidget(
                          imgPath: "assets/img/ask_disha.png",
                          imgColor: Colors.cyan,
                          title: "Book Seat",
                          description: "Passenger Reservation",
                          cardColor: Colors.teal,
                          textColor: Colors.black,
                        ),
                      ),
                      SizedBox(width: setWidth(14)),
                      const TrainServiceCardWidget(
                        imgPath: "assets/img/rooms.png",
                        imgColor: Colors.cyan,
                        title: "Rooms",
                        description: "Book rooms at stations",
                        cardColor: Colors.teal,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: setHeight(50)),
                  Padding(
                    padding: EdgeInsets.only(left: setWidth(21)),
                    child: Text(
                      "Other services",
                      style: TextStyle(
                        color: const Color(0xFFA5A5A5),
                        fontWeight: FontWeight.w500,
                        fontSize: setHeight(21),
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  SizedBox(height: setHeight(14)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const OtherServiceCardWidget(
                        title: "Flight",
                        description: "Book your next flight",
                        cardColor: Colors.white,
                        textColor: Colors.black,
                      ),
                      SizedBox(width: setWidth(14)),
                      const OtherServiceCardWidget(
                        title: "Hotel",
                        description: "Book your next stay",
                        cardColor: Colors.white,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: setHeight(14)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const OtherServiceCardWidget(
                        title: "Bus",
                        description: "Book your next bus",
                        cardColor: Colors.white,
                        textColor: Colors.black,
                      ),
                      SizedBox(width: setWidth(14)),
                      const OtherServiceCardWidget(
                        title: "Tourism",
                        description: "Explore tour options",
                        cardColor: Colors.white,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}


