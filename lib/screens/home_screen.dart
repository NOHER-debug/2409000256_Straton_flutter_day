import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/study_session.dart';
import '../providers/sessions_provider.dart';
import '../widgets/empty_state.dart';
import '../widgets/session_tile.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessions = ref.watch(sessionsProvider);
    final completedCount = ref.watch(completedCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro Study'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: 'Clear all',
            onPressed: () {
              ref.read(sessionsProvider.notifier).clearAll();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.red.shade50,
            child: Text(
              'Completed sessions: $completedCount',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: sessions.isEmpty
                ? const EmptyState()
                : ListView.builder(
                    itemCount: sessions.length,
                    itemBuilder: (context, index) {
                      return SessionTile(session: sessions[index]);
                    },
                  ),
          ),
        ],
      ),
      // TEMPORARY button for testing. We remove it in M6.
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Add test session'),
        onPressed: () {
          final notifier = ref.read(sessionsProvider.notifier);
          notifier.addSession(
            StudySession(
              date: DateTime.now(),
              minutes: 25,
              completed: sessions.length.isEven, // alternates true/false
            ),
          );
        },
      ),
    );
  }
}
