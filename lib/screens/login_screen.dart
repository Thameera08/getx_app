import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxapp/screens/home_screen.dart';
import 'package:getxapp/theme/theme.dart'; // Replace with your actual HomeScreen import

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  void login() {
    print('Email: ${email.value}, Password: ${password.value}');

    if (email.value == 'admin' && password.value == 'admin') {
      Get.off(() => const HomeScreen());
    } else {
      Get.snackbar(
        'Error',
        'Invalid email or password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary1,
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'lib/images/test.png',
              width: 300,
            ),
            TextField(
              onChanged: (value) => loginController.email.value = value,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) => loginController.password.value = value,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: loginController.login,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary1,
                padding: const EdgeInsets.all(16),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
