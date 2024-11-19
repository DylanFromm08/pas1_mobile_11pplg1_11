import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/team_controller.dart';
import '../../components/team_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TeamController teamController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite teams'),
      ),
      body: Obx(
        () => teamController.favoriteTeams.isEmpty
            ? const Center(
                child: Text('You have no favorite teams yet'),
              )
            : ListView.builder(
                itemCount: teamController.favoriteTeams.length,
                itemBuilder: (context, index) {
                  final team = teamController.favoriteTeams[index];
                  return TeamCard(team: team);
                },
              ),
      ),
    );
  }
} 