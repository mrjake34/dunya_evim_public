import 'package:dunya_evim/core/constants/color/colors.dart';
import 'package:flutter/material.dart';

import '../../../src/text/body_text.dart';

extension Utils on BuildContext {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(text),
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static errorSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(
        text,
        style: const TextStyle(color: Colors.red),
      ),
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

final class ShowSnackbar {
  ShowSnackbar._init();
  static final ShowSnackbar instance = ShowSnackbar._init();
  final messengerKey = GlobalKey<ScaffoldMessengerState>();
  Future<void> showSnackBar(String? text) async {
    if (text == null) return;

    final snackBar = await SnackBar(
      content: BodyText(
        text: text,
      ),
      showCloseIcon: true,
    );

    messengerKey.currentState?.showSnackBar(snackBar);
  }

  Future<void> errorSnackBar(String? text, {String? title}) async {
    if (text == null) return;

    final snackBar = await SnackBar(
      showCloseIcon: true,
      closeIconColor: AppColors.errorColor,
      content: ListTile(
        leading: Icon(
          Icons.error_outline,
          color: AppColors.errorColor,
        ),
        title: Text(
          title ?? '',
          style: TextStyle(color: AppColors.errorColor),
        ),
        subtitle: BodyText(
          text: text,
          style: const TextStyle(color: AppColors.errorColor),
        ),
      ),
    );

    messengerKey.currentState?.showSnackBar(snackBar);
  }
}
