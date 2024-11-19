import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/auth/login_screen.dart';
import 'screens/main_screen.dart';
import 'controllers/login_controller.dart';
import 'controllers/team_controller.dart';
import 'controllers/user_controller.dart';
import 'controllers/auth_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(UserController());
  Get.put(LoginController());
  Get.put(TeamController());
  Get.put(AuthController());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ISOCCER++',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: Colors.blue.shade700,
          secondary: Colors.orange,
          surface: Colors.grey.shade100,
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: const Color.fromARGB(255, 245, 66, 66),
          secondary: const Color.fromARGB(255, 245, 66, 66),
          surface: const Color(0xFF1E1E1E),
          background: const Color(0xFF121212),
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardTheme: CardTheme(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF1E1E1E),
          elevation: 0,
          centerTitle: true,
        ),
      ),
      themeMode: ThemeMode.dark,
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/maindashboard', page: () => MainScreen()),
      ],
    );
  }
}
