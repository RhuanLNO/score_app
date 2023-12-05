class Goals {
  final int home;
  final int away;

  Goals({required this.home, required this.away});

  factory Goals.fromJson(Map<String, dynamic> json) {
    return Goals(
      home: json['home'] ?? 0,
      away: json['away'] ?? 0,
    );
  }
}
