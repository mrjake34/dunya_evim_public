import 'package:dunya_evim/core/utils/snackbar/show_snackbar.dart';
import 'package:flutter/material.dart';

extension AppExtension on BuildContext {
  Size get pageSize => MediaQuery.of(this).size;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  ShowSnackbar get showSnackBar => ShowSnackbar.instance;
}
