import 'fixture.dart';
import 'parameters.dart';

class FixtureResponse {
  final String get;
  final Parameters parameters;
  final List<Fixture> response;

  FixtureResponse(
      {required this.get, required this.parameters, required this.response});

  factory FixtureResponse.fromJson(Map<String, dynamic> json) {
    return FixtureResponse(
      get: json['get'] ?? '',
      parameters: Parameters.fromJson(json['parameters']),
      response: (json['response'] as List)
          .map((item) => Fixture.fromJson(item))
          .toList(),
    );
  }
}
