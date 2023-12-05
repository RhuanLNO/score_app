class Home {
  final int home;
  final int away;

  Home({required this.home, required this.away});

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
      home: json['id'] ?? 0,
      away: json['name'] ?? 0,
    );
  }
}
