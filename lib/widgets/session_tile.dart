import 'package:flutter/material.dart';

import '../models/study_session.dart';

class SessionTile extends StatelessWidget {
  final StudySession session;
  final VoidCallback onTap;

  const SessionTile({super.key, required this.session, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final d = session.date;
    final time = '${d.hour}:${d.minute.toString().padLeft(2, '0')}';
    final dateText = '${d.day}/${d.month}/${d.year}  $time';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          session.completed ? Icons.check_circle : Icons.cancel,
          color: session.completed ? Colors.green : Colors.orange,
        ),
        title: Text('${session.minutes} minutes'),
        subtitle: Text(dateText),
        trailing: Text(session.completed ? 'Completed' : 'Stopped early'),
      ),
    );
  }
}
