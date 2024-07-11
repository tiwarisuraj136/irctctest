import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:irctctest/features/signUp/controller/signUp_page_controller.dart';

class SignUpPageView extends GetView<SignUpController> {
  const SignUpPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text(
                  "Create a new account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Hello, there!",
                      style: TextStyle(fontSize: 18, color: Colors.teal),
                    ),
                    SizedBox(width: 5), // Add some spacing between text and icon
                    Icon(
                      FontAwesomeIcons.hand,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 70),
                  Center(
                    child: ClipOval(
                      child: Image.asset(
                        'assets/logo3.png', // Ensure the path matches your asset folder and pubspec.yaml
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Obx(() => TextField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      labelText: 'Email ID',
                      prefixIcon: const Icon(Icons.email),
                      errorText: controller.emailError.value.isEmpty ? null : controller.emailError.value,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  )),
                  const SizedBox(height: 20),
                  Obx(() => TextField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      prefixIcon: const Icon(Icons.person),
                      errorText: controller.nameError.value.isEmpty ? null : controller.nameError.value,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  )),
                  const SizedBox(height: 20),
                  Obx(() => TextField(
                    controller: controller.mobileController,
                    decoration: InputDecoration(
                      labelText: 'Mobile',
                      prefixIcon: const Icon(Icons.call),
                      errorText: controller.mobileError.value.isEmpty ? null : controller.mobileError.value,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  )),
                  const SizedBox(height: 20),
                  Obx(() => TextField(
                    controller: controller.passwordController,
                    obscureText: controller.isPasswordHidden.value,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(controller.isPasswordHidden.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                      errorText: controller.passwordError.value.isEmpty ? null : controller.passwordError.value,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  )),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      controller.signUp();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Set the button color to blue
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Center(
                      child: Text('SignUp', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      Expanded(child: Divider(thickness: 1, color: Colors.blue)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Or signUp with",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      Expanded(child: Divider(thickness: 1, color: Colors.blue)),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.facebook),
                        iconSize: 40,
                        onPressed: () {
                          controller.signUpWithFacebook();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.logout),
                        iconSize: 40,
                        onPressed: () {
                          controller.signOut();
                        },
                      ),
                      IconButton(
                        icon: const Icon(FontAwesomeIcons.google),
                        iconSize: 35,
                        onPressed: () {
                          controller.signUpWithGoogle();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.call),
                        iconSize: 40,
                        onPressed: () {
                          Get.toNamed('/phone'); // Replace with your route
                          // Handle Otp login
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Center(
              child: TextButton(
                onPressed: () {
                  Get.toNamed('/login'); // Replace with your route
                },
                child: const Text(
                  "Don't have an account? Login",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
