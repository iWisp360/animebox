import 'package:animebox/core/servers/presentation/providers/servers_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serverListProvider = AsyncNotifierProvider(() => ServersListProvider());
