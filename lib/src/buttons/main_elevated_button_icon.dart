import 'package:flutter/material.dart';

class MainElevatedButtonIcon extends StatelessWidget {
  const MainElevatedButtonIcon({required this.child,required this.onPressed, required this.icon, super.key});
  final Function()? onPressed;
  final Widget? child;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    final Size pageSize = MediaQuery.of(context).size;
    return SizedBox(
        width: pageSize.width,
        height: 40,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          label: child!,
          icon: icon!,
        ));
  }
}
