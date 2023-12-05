class Parameters {
  final String team;
  final String season;
  final String from;
  final String to;

  Parameters(
      {required this.team,
      required this.season,
      required this.from,
      required this.to});

  factory Parameters.fromJson(Map<String, dynamic> json) {
    return Parameters(
      team: json['team'] ?? '',
      season: json['season'] ?? '',
      from: json['from'] ?? '',
      to: json['to'] ?? '',
    );
  }
}
