import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MainElevatedButton extends StatelessWidget {
  const MainElevatedButton({required this.text, required this.onPressed, super.key});
  final Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final Size pageSize = MediaQuery.of(context).size;
    return SizedBox(
      width: pageSize.width,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text).tr(),
      ),
    );
  }
}
