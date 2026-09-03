import 'package:animebox/core/servers/domain/entities/server.dart';
import 'package:animebox/core/servers/presentation/providers/servers_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'server_provider.g.dart';

@riverpod
Future<Server?> server(Ref ref, String serverUuid) async =>
    await ref.watch(serversListProvider.notifier).getServer(serverUuid);
