import 'package:animebox/core/dates/domain/repositories/dates_repository.dart';
import 'package:animebox/gen/strings.g.dart';
import 'package:intl/intl.dart';

class DatesRepositoryImpl implements DatesRepository {
  @override
  DateFormat getRelativeDateFormat() {
    return DateFormat.yMMMd(
      LocaleSettings.currentLocale.flutterLocale.languageCode,
    );
  }

  @override
  DateFormat getAbsoluteDateFormat() {
    return DateFormat.yMd(
      LocaleSettings.currentLocale.flutterLocale.languageCode,
    );
  }

  const DatesRepositoryImpl();
}
