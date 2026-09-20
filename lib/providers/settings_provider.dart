import 'package:flutter_riverpod/flutter_riverpod.dart';

class FocusMinutesNotifier extends Notifier<int> {
  @override
  int build() => 25; // default focus time

  void setMinutes(int minutes) {
    state = minutes;
  }
}

final focusMinutesProvider = NotifierProvider<FocusMinutesNotifier, int>(
  FocusMinutesNotifier.new,
);

class BreakMinutesNotifier extends Notifier<int> {
  @override
  int build() => 5; // default break time

  void setMinutes(int minutes) {
    state = minutes;
  }
}

final breakMinutesProvider = NotifierProvider<BreakMinutesNotifier, int>(
  BreakMinutesNotifier.new,
);
