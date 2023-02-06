import 'package:intl/intl.dart';

class MyFunctions
{
  String convertDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    return formatter.format(dateTime);
  }
}