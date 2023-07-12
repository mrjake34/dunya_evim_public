import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BodyTitleText extends Text {
  final String text;
  const BodyTitleText({super.key, required this.text}) : super(text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge,
      textAlign: TextAlign.center,
    ).tr();
  }
}
