import 'dart:async';
import 'dart:math';

import 'package:animebox/core/global_info_feedback/entities.dart';
import 'package:animebox/core/i18n/presentation/providers/i18n_provider.dart';
import 'package:animebox/gen/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
class GlobalNotification extends _$GlobalNotification {
  Timer? _hideTimer;
  NotificationState? _currentState;
  MessageBuilderFn? _messageBuilder;

  @override
  NotificationState build() {
    final translations = ref.watch(i18nProvider);
    if (_messageBuilder != null) {
      _currentState = _currentState?.copyWith(
        message: _messageBuilder!(translations, ref),
      );
    }

    return _currentState ??= const NotificationState(enabled: false);
  }

  void setState({
    required MessageBuilderFn messageBuilder,
    required Priority priority,
    Widget? leading,
  }) {
    final translations = ref.read(i18nProvider);
    _messageBuilder = messageBuilder;

    _currentState = state = NotificationState(
      message: messageBuilder(translations, ref),
      enabled: state.enabled,
      leading: leading,
      priority: priority,
    );
  }

  void toggle({bool persistent = false}) =>
      set(enabled: !state.enabled, persistent: persistent);

  void set({bool persistent = false, required bool enabled}) {
    _hideTimer?.cancel();

    _currentState = state = state.copyWith(enabled: enabled);

    if (state.enabled && !persistent) {
      disablePersistence();
    }
  }

  void disablePersistence() => _hideTimer = timeoutTimer();

  Timer timeoutTimer() {
    final timeout = max(5, ((state.message ?? "").length / 8).ceil());

    return Timer(
      Duration(seconds: timeout),
      () => _currentState = state = state.copyWith(enabled: false),
    );
  }
}

typedef MessageBuilderFn = String Function(Translations translations, Ref ref);
