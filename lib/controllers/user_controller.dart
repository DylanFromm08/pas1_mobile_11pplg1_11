import 'package:get/get.dart';

class UserController extends GetxController {
  final username = ''.obs;
  final full_name = ''.obs;

  void setUsername(String value) {
    username.value = value;
  }

  String getUsername() {
    return username.value;
  }

  void setFullName(String value) {
    full_name.value = value;
  }

  String getFullName() {
    return full_name.value;
  }
} 