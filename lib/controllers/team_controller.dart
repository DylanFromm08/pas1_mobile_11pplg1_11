import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/team.dart';

class TeamController extends GetxController {
  final premierLeagueTeams = <Team>[].obs;
  final laLigaTeams = <Team>[].obs;
  final favoriteTeams = <Team>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllLeagues();
  }

  Future<void> fetchAllLeagues() async {
    isLoading.value = true;
    await Future.wait([
      fetchPremierLeagueTeams(),
      fetchLaLigaTeams(),
    ]);
    isLoading.value = false;
  }

  Future<void> fetchPremierLeagueTeams() async {
    try {
      final response = await http.get(
        Uri.parse('https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League'),
      );
      
      final data = json.decode(response.body);
      if (data['teams'] != null) {
        premierLeagueTeams.value = (data['teams'] as List)
            .map((team) => Team.fromJson(team))
            .toList();
      }
    } catch (e) {
      print('Error fetching Premier League teams: $e');
    }
  }

  Future<void> fetchLaLigaTeams() async {
    try {
      final response = await http.get(
        Uri.parse('https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?s=Soccer&c=Spain'),
      );
      
      final data = json.decode(response.body);
      if (data['teams'] != null) {
        laLigaTeams.value = (data['teams'] as List)
            .map((team) => Team.fromJson(team))
            .toList();
      }
    } catch (e) {
      print('Error fetching La Liga teams: $e');
    }
  }

  void toggleFavorite(Team team) {
    if (favoriteTeams.contains(team)) {
      favoriteTeams.remove(team);
    } else {
      favoriteTeams.add(team);
    }
  }
} 