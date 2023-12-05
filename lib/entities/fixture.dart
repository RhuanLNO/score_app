import 'fixture_details.dart';
import 'goals.dart';
import 'league.dart';
import 'score.dart';
import 'teams.dart';

class Fixture {
  final FixtureDetails fixture;
  final League league;
  final Teams teams;
  final Goals goals;
  final Score score;

  Fixture(
      {required this.fixture,
      required this.league,
      required this.teams,
      required this.goals,
      required this.score});

  factory Fixture.fromJson(Map<String, dynamic> json) {
    print('fixture.dart $json');
    return Fixture(
      fixture: FixtureDetails.fromJson(json['fixture']),
      league: League.fromJson(json['league']),
      teams: Teams.fromJson(json['teams']),
      goals: Goals.fromJson(json['goals']),
      score: Score.fromJson(json['score']),
    );
  }
}
