import 'package:flutter/material.dart';

class AddAdvertBottomNavBar extends StatelessWidget {
  const AddAdvertBottomNavBar({super.key, required this.leftOnPressed, required this.rightOnPressed});
  final Function()? leftOnPressed;
  final Function()? rightOnPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Expanded(
          flex: 3,
          child: ElevatedButton(
            onPressed: leftOnPressed,
            child: Icon(
              Icons.arrow_circle_left_outlined,
            ),
          ),
        ),
        Spacer(
          flex: 2,
        ),
        Expanded(
          flex: 3,
          child: ElevatedButton(
            onPressed: rightOnPressed,
            child: Icon(
              Icons.arrow_circle_right_outlined,
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
