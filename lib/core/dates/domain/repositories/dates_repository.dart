import 'package:intl/intl.dart';

abstract class DatesRepository {
  DateFormat getRelativeDateFormat();
  DateFormat getAbsoluteDateFormat();
}
