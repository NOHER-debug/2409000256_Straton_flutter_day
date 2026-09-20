import 'package:flutter/material.dart';

import '../models/study_session.dart';

class SessionSummaryScreen extends StatelessWidget {
  final StudySession session;

  const SessionSummaryScreen({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    final d = session.date;
    final time = '${d.hour}:${d.minute.toString().padLeft(2, '0')}';
    final dateText = '${d.day}/${d.month}/${d.year} at $time';

    return Scaffold(
      appBar: AppBar(title: const Text('Session Summary')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                session.completed ? Icons.emoji_events : Icons.hourglass_bottom,
                size: 100,
                color: session.completed ? Colors.green : Colors.orange,
              ),
              const SizedBox(height: 24),
              Text(
                session.completed ? 'Well done!' : 'Stopped early',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '${session.minutes} minutes of focus',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 8),
              Text(dateText),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back to history'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
