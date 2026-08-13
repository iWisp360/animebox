import 'package:animebox/core/configs/data/repositories/config_repository_impl.dart';
import 'package:animebox/core/configs/domain/repositories/config_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<ConfigRepository> configRepositoryProvider = Provider(
  (ref) => ConfigRepositoryImpl(),
);
