import 'package:intl/intl.dart';

String dateFormat(DateTime dateTime){
  return DateFormat.yMMMEd().format(dateTime);
}