import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final isLoggedIn = false.obs;
  
  Future<bool> login(String username, String password, String full_name) async {
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse('https://mediadwi.com/api/latihan/login'),
        body: {
          'username': username,
          'password': password,
          'fullname': full_name,
        },
      );
      
      final data = json.decode(response.body);
      if (data['status'] == 'success') {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', data['token'] ?? '');
        await prefs.setString('username', username);
        await prefs.setString('fullname', full_name);
        isLoggedIn.value = true;
        isLoading.value = false;
        return true;
      }
      isLoading.value = false;
      return false;
    } catch (e) {
      isLoading.value = false;
      return false;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    isLoggedIn.value = false;
  }
} 