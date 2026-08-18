import 'package:animebox/core/files/domain/providers/external_data_directory_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final externalDataDirectoryProvider = AsyncNotifierProvider(
  () => ExternalDataDirectoryProvider(),
);
