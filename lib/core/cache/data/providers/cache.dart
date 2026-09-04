import 'package:animebox/core/cache/data/repositories/cache.dart';
import 'package:animebox/core/cache/domain/repositories/cache.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cache.g.dart';

@Riverpod(keepAlive: true)
Future<CacheRepository> cacheRepository(Ref ref) =>
    CacheRepositoryImpl.defaultPath();
