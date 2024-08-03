import 'package:intl/intl.dart';

class DateService {
  static String formatDate(DateTime dateTime) {
    final formatter = DateFormat(
      'EEE, dd MMM yyyy \nhh:mm a',
    );
    return formatter.format(dateTime);
  }
}
