import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RequiredText extends StatelessWidget {
  const RequiredText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text.tr(),
        children: [
          TextSpan(
            text: '*',
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ],
      ),
    );
  }
}
