import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/team_controller.dart';
import '../../components/team_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TeamController teamController = Get.find();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('List of Football Clubs'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Premier League'),
              Tab(text: 'La Liga'),
            ],
          ),
        ),
        body: Obx(
          () => teamController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: teamController.premierLeagueTeams.length,
                      itemBuilder: (context, index) {
                        final team = teamController.premierLeagueTeams[index];
                        return TeamCard(team: team);
                      },
                    ),
                    ListView.builder(
                      itemCount: teamController.laLigaTeams.length,
                      itemBuilder: (context, index) {
                        final team = teamController.laLigaTeams[index];
                        return TeamCard(team: team);
                      },
                    ),
                  ],
                ),
        ),
      ),
    );
  }
} 