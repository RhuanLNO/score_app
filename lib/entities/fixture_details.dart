import 'status.dart';
import 'venue.dart';

class FixtureDetails {
  final int id;
  final String referee;
  final String timezone;
  final String date;
  final int timestamp;
  final Map<String, int?> periods;
  final Venue venue;
  final Status status;

  FixtureDetails({
    required this.id,
    required this.referee,
    required this.timezone,
    required this.date,
    required this.timestamp,
    required this.periods,
    required this.venue,
    required this.status,
  });

  factory FixtureDetails.fromJson(Map<String, dynamic> json) {
    return FixtureDetails(
      id: json['id'] ?? 0,
      referee: json['referee'] ?? '',
      timezone: json['timezone'] ?? '',
      date: json['date'] ?? '',
      timestamp: json['timestamp'] ?? 0,
      periods: json['periods'].cast<String, int?>(),
      venue: Venue.fromJson(json['venue']),
      status: Status.fromJson(json['status']),
    );
  }
}
