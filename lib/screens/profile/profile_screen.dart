import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              userController.setUsername('');
              userController.setFullName('');
              Get.offAllNamed('/login');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: const Color.fromARGB(255, 245, 66, 66),
                    child: Icon(Icons.person, size: 50, color: Color.fromARGB(255, 177, 48, 48)),
                  ),
                  const SizedBox(height: 16),
                  Obx(() => Text(
                        userController.getUsername(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      )),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profile'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text('Privacy & Security'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help & Support'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.warning),
              title: const Text('To Login Page(log out)'),
              trailing: const Icon(Icons.logout),
              onTap: () {
                userController.setUsername('');
                userController.setFullName('');
                Get.offAllNamed('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
} 