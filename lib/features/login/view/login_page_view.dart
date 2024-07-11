import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:irctctest/core/routes_constant.dart';
import 'package:irctctest/features/login/controller/login_page_controller.dart';
import 'package:sunicons/sunicons.dart';

class LoginPageView extends GetView<LoginPageController>{
  const LoginPageView({super.key});

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
                  "Login to your account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Hello, welcome back!",
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorText: controller.emailError.value.isEmpty ? null : controller.emailError.value,
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorText: controller.passwordError.value.isEmpty ? null : controller.passwordError.value,
                    ),
                  )),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: controller.login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Set the button color to blue
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Center(
                      child: Text('Login', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    children: [
                      Expanded(child: Divider(thickness: 1, color: Colors.blue)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Or sign in with",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      Expanded(child: Divider(thickness: 1, color: Colors.blue)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.facebook),
                        iconSize: 40,
                        onPressed: () {
                          // Handle Facebook login
                        },
                      ),
                      IconButton(
                        icon: const Icon(FontAwesomeIcons.google),
                        iconSize: 35,
                        onPressed: () {
                          // Handle Google login
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
                  Get.toNamed(RoutesConstant.signUp); // Replace with your route
                },
                child: const Text(
                  "Don't have an account? Sign Up",
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

