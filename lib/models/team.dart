class Team{
  final String id;
  final String name;
  final String altName;
  final String shortName;
  final String formedYear;
  final String location;
  final String stadium;
  final String stadiumCapacity;
  final String logo;
  final String fallbackLogo;
  final String description;

  Team({
    required this.id,
    required this.name,
    required this.altName,
    required this.shortName,
    required this.formedYear,
    required this.location,
    required this.stadium,
    required this.stadiumCapacity,
    required this.logo,
    required this.fallbackLogo,
    required this.description,
  });
  factory Team.fromJson(Map<String, dynamic> json) {
   return Team(
      id: json['idTeam'] ?? '',
      name: json['strTeam'] ?? '',
      altName: json['strTeamAlternate'] ?? '',
      shortName: json['strTeamShort'] ?? '',
      formedYear: json['intFormedYear'] ?? '',
      location: json['strLocation'] ?? '',
      stadium: json['strStadium'] ?? '',
      stadiumCapacity: json['intStadiumCapacity'] ?? '',
      logo: json['strBadge'] ?? '',
      fallbackLogo: json['strLogo'] ?? '',
      description: json['strDescriptionEN'] ?? '',
    );
  }
}