import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irctctest/features/Logout/controller/logout_controller.dart';

class LogoutPage extends GetView<LogoutController>{
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await controller.signOut();
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }


}