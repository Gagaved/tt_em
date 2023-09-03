

import 'package:intl/intl.dart';

String priceNumberFormat(dynamic number){
  return NumberFormat('###,000', 'ru').format(number);
}