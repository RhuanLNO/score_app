import 'home.dart';

class Score {
  final Home halftime;
  final Home fulltime;
  final Home extratime;
  final Home penalty;

  Score({
    required this.halftime,
    required this.fulltime,
    required this.extratime,
    required this.penalty,
  });

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      halftime: Home.fromJson(json['halftime']),
      fulltime: Home.fromJson(json['fulltime']),
      extratime: Home.fromJson(json['extratime']),
      penalty: Home.fromJson(json['penalty']),
    );
  }
}
