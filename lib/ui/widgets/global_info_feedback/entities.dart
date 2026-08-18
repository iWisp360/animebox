import 'package:freezed_annotation/freezed_annotation.dart';

part 'entities.freezed.dart';

enum Priority { info, warning, error }

@freezed
abstract class NotificationState with _$NotificationState {
  const factory NotificationState({
    String? message,
    required bool enabled,
    Priority? priority,
  }) = _NotificationState;
}
