import 'team_details.dart';

class Teams {
  final TeamDetails home;
  final TeamDetails away;

  Teams({required this.home, required this.away});

  factory Teams.fromJson(Map<String, dynamic> json) {
    return Teams(
      home: TeamDetails.fromJson(json['home']),
      away: TeamDetails.fromJson(json['away']),
    );
  }
}
