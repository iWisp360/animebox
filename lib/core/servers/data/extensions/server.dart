import 'package:animebox/core/servers/domain/entities/server.dart';

extension Actions on Server {
  int enabledSources() {
    int enabled = 0;
    for (final source in supportedAnimeSources) {
      if (source.enabled) {
        enabled++;
      }
    }

    return enabled;
  }

  void restoreSourcesEnabledState() {}
}
