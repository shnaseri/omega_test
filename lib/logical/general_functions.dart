import 'package:intl/intl.dart';

String getUrlImageOfService(String code) {
  return "http://ebeheshtapi.omegadn.ir/api/v1/Service/item/$code/image";
}

final formatter = NumberFormat.currency(name: '', decimalDigits: 0);
