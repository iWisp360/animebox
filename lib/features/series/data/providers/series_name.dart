import 'package:animebox/features/series/data/repositories/series_name_impl.dart';
import 'package:animebox/features/series/domain/repositories/series_name.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'series_name.g.dart';

@riverpod
SeriesName seriesName(Ref ref) => SeriesNameImpl();
