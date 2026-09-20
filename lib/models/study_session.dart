class StudySession {
  final DateTime date;
  final int minutes;
  final bool completed;

  const StudySession({
    required this.date,
    required this.minutes,
    required this.completed,
  });

  // Object -> Map (so it can be saved as JSON text)
  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'minutes': minutes,
      'completed': completed,
    };
  }

  factory StudySession.fromJson(Map<String, dynamic> json) {
    return StudySession(
      date: DateTime.parse(json['date'] as String),
      minutes: json['minutes'] as int,
      completed: json['completed'] as bool,
    );
  }
}
