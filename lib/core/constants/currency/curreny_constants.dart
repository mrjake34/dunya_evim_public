import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class CurrenyConstants {
  CurrenyConstants._();

  static CurrencyTextInputFormatter eu = CurrencyTextInputFormatter(symbol: '€');
  static CurrencyTextInputFormatter usd = CurrencyTextInputFormatter(symbol: "\$");
  static CurrencyTextInputFormatter tl = CurrencyTextInputFormatter(symbol: "₺");
  static CurrencyTextInputFormatter pound = CurrencyTextInputFormatter(symbol: "£");
}
