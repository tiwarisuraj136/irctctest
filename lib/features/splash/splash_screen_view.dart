import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irctctest/features/splash/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashScreenController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/train4.jpg",
                fit: BoxFit.cover,  // This ensures the image covers the entire screen
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),  // Adjust the padding as needed
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "IRCTC",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Ensure text is visible against the background
                      ),
                    ),
                    const SizedBox(height: 10), // Spacing between the two texts
                    const Text(
                      "LifeLine of the Nation",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white, // Ensure text is visible against the background
                      ),
                    ),
                    const SizedBox(height: 20), // Spacing between the text and the dots
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
