import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro_study/models/study_session.dart';

// The Notifier: holds the list of sessions and the methods to change it
class SessionsNotifier extends Notifier<List<StudySession>> {
  @override
  List<StudySession> build() {
    return []; // starting value: empty list
  }

  void addSession(StudySession session) {
    state = [session, ...state]; // newest session goes first
  }

  void clearAll() {
    state = [];
  }
}

// The provider: how screeens get access to the Notifier
final sessionsProvider = NotifierProvider<SessionsNotifier, List<StudySession>>(
  SessionsNotifier.new,
);

// A provider that calculates the session count from the list above
final completedCountProvider = Provider<int>((ref) {
  final sessions = ref.watch(sessionsProvider);
  return sessions.where((s) => s.completed).length;
});
