import 'package:animebox/core/servers/data/repositories/server_repository_impl.dart';
import 'package:animebox/core/servers/domain/repositories/server_repository.dart';

class BrowsePageController {
  final ServerRepository serverRepository;

  BrowsePageController({ServerRepository? serverRepository})
    : serverRepository = serverRepository ?? ServerRepositoryImpl();
}
