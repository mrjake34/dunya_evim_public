import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BodyText extends Text {
  final String text;
  final TextStyle? style;
  const BodyText({super.key, required this.text, this.style}) : super(text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    ).tr();
  }
}
