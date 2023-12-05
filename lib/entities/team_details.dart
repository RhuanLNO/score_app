class TeamDetails {
  final int id;
  final String name;
  final String logo;
  final bool? winner;

  TeamDetails(
      {required this.id,
      required this.name,
      required this.logo,
      this.winner = false});

  factory TeamDetails.fromJson(Map<String, dynamic> json) {
    return TeamDetails(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      logo: json['logo'] ?? '',
      winner: json['winner'],
    );
  }
}
