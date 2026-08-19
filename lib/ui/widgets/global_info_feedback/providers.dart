import 'dart:async';

import 'package:animebox/core/configs/data/providers/config_provider.dart';
import 'package:animebox/core/i18n/context.dart';
import 'package:animebox/gen/strings.g.dart';
import 'package:animebox/ui/widgets/global_info_feedback/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final globalNotificationController = NotifierProvider(
  () => GlobalNotificationController(),
);

class GlobalNotificationController extends Notifier<NotificationState> {
  BuildContext? _parentContext;
  Timer? _hideTimer;

  @override
  NotificationState build() {
    ref.onDispose(() => _hideTimer?.cancel());
    return const NotificationState(enabled: false);
  }

  void setState({
    required Function(Translations i18n) message,
    required Priority priority,
  }) {
    final context = _parentContext;
    if (context == null) {
      throw Exception("Didn't set context in GlobalNotificationController");
    } else if (!context.mounted) {
      throw Exception("Context for GlobalNotificationController is unmounted");
    }

    final listener = ref.listen(configProvider, (prev, next) {
      next.when(
        data: (_) => state = state.copyWith(
          message: message(context.i18n),
          priority: priority,
        ),
        error: (_, _) => (),
        loading: () => (),
      );
    });
  }

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

  void setContext(BuildContext context) => _parentContext = context;
  void disablePersistence() => _hideTimer?.cancel();
  Timer timeoutTimer() => Timer(
    const Duration(seconds: 5),
    () => state = state.copyWith(enabled: false),
  );
}
