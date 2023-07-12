import 'package:dunya_evim/core/base/extension/app_extension.dart';
import 'package:flutter/material.dart';

class LoadingLinear extends StatelessWidget {
  const LoadingLinear({super.key}) : super();

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      color: context.colorScheme.primary,
    );
  }
}
