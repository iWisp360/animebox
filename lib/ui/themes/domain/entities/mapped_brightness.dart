import 'package:flutter/material.dart';

enum MappedBrightness {
  light,
  dark;

  Brightness toBrightness() => switch (this) {
    .light => .light,
    .dark => .dark,
  };

  factory MappedBrightness.fromBrightness(Brightness brightness) =>
      switch (brightness) {
        .light => .light,
        .dark => .dark,
      };
}
