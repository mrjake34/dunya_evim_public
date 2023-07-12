import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ButtonText extends Text {
  final String text;
  const ButtonText({super.key, required this.text}) : super(text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.primary),
      textAlign: TextAlign.center,
      softWrap: true,
    ).tr();
  }
}
