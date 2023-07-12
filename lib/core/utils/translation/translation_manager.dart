import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TranslationManager extends EasyLocalization {
  TranslationManager({
    required super.child,
  }) : super(path: 'assets/translation', supportedLocales: [Locale('en', 'US'), Locale('tr', 'TR')],startLocale: Locale('en', 'US'));
}
