import 'package:flutter/material.dart';

class AppRadius {
  AppRadius._();

  static const double cardRadius = 8;
  static const OutlineInputBorder textFieldBorder = OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(AppRadius.cardRadius)));
}
