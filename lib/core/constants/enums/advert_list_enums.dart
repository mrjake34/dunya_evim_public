import 'package:dunya_evim/core/utils/translation/locale_keys.g.dart';

enum AdvertListCountriesEnums {
  usa('US', LocaleKeys.countries_usa),
  greatBritania('GB', LocaleKeys.countries_gb),
  canada('CA', LocaleKeys.countries_canada),
  germany('DE', LocaleKeys.countries_germany),
  netherlands('NL', LocaleKeys.countries_netherlands),
  belgium('BE', LocaleKeys.countries_belgium),
  poland('PL', LocaleKeys.countries_poland),
  romania('RO', LocaleKeys.countries_romania),
  france('FR', LocaleKeys.countries_france),
  italy('IT', LocaleKeys.countries_italy);

  final String value;
  final String localeKeys;

  const AdvertListCountriesEnums(this.value, this.localeKeys);

  @override
  String toString() => value;
}
