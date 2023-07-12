import 'package:flutter/material.dart';

class MainIconButton extends StatelessWidget {
  const MainIconButton({required this.onPressed, required this.icon, super.key});
  final Function()? onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    final Size pageSize = MediaQuery.of(context).size;
    return SizedBox(
        width: pageSize.width,
        height: 40,
        child: IconButton(
          onPressed: onPressed,
          icon: icon,
        ));
  }
}
