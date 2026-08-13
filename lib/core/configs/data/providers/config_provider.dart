import 'package:animebox/core/configs/domain/providers/config_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final configProvider = AsyncNotifierProvider(() => ConfigProvider());
