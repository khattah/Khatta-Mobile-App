import 'package:intl/intl.dart';
String currencyFormat(String currency) {
  try {
    double dem = double.parse(currency);
    final oCcy = new NumberFormat("#,##0.00", "en_US");
    return oCcy.format(dem);
  }catch(e){
    print(e);
    return currency;
  }
}
