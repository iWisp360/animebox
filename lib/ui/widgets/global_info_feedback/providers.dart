import 'dart:async';

import 'package:animebox/ui/widgets/global_info_feedback/entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final globalNotificationController = NotifierProvider(
  () => GlobalNotificationController(),
);

class GlobalNotificationController extends Notifier<NotificationState> {
  Timer? _hideTimer;

  @override
  NotificationState build() {
    ref.onDispose(() => _hideTimer?.cancel());
    return const NotificationState(enabled: false);
  }

  void setState({required String message, required Priority priority}) =>
      state = state.copyWith(message: message, priority: priority);

  void toggle({bool persistent = false}) {
    _hideTimer?.cancel();

    state = state.copyWith(enabled: !state.enabled);

    if (state.enabled && !persistent) {
      _hideTimer = Timer(
        const Duration(seconds: 5),
        () => state = state.copyWith(enabled: false),
      );
    }
  }

  void disablePersistence() => _hideTimer?.cancel();
  Timer timeoutTimer() => Timer(
    const Duration(seconds: 5),
    () => state = state.copyWith(enabled: false),
  );
}
