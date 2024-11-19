import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'user_controller.dart';

class LoginController extends GetxController {
  final String baseUrl = 'https://mediadwi.com';

  var isChecked = false.obs;
  var isButtonEnabled = false.obs;
  var username = ''.obs;
  var password = ''.obs;
  var isUsernameFocused = false.obs;
  var isPasswordFocused = false.obs;
  var isPasswordVisible = false.obs;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    usernameFocusNode.addListener(() {
      isUsernameFocused.value = usernameFocusNode.hasFocus;
    });
    passwordFocusNode.addListener(() {
      isPasswordFocused.value = passwordFocusNode.hasFocus;
    });
    
    
    usernameController.addListener(() {
      username.value = usernameController.text;
      checkIfButtonShouldBeEnabled();
    });
    
    passwordController.addListener(() {
      password.value = passwordController.text;
      checkIfButtonShouldBeEnabled();
    });
  }

  Future<void> login() async {
    if (!isButtonEnabled.value) return;
    
    final url = Uri.parse("${baseUrl}/api/latihan/login");

    try {
      final response = await http.post(
        url,
        body: {
          "username": usernameController.text,
          "password": passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == true) {
          final userController = Get.find<UserController>();
          userController.setUsername(usernameController.text);
          userController.getFullName();
          Get.snackbar(
            "Success", 
            data['message'] ?? 'Login successful',
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
           usernameController.text = '';
           passwordController.text = '';
          Get.offAllNamed('/maindashboard');
        } else {
          Get.snackbar(
            "Error", 
            data['message'] ?? 'Login failed',
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          "Error", 
          "Server error: ${response.statusCode}",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error", 
        "Connection error: $e",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void checkIfButtonShouldBeEnabled() {
    isButtonEnabled.value = username.value.isNotEmpty && password.value.isNotEmpty;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void resetValue() {
    usernameController.text = '';
    passwordController.text = '';
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    super.onClose();
  }
}