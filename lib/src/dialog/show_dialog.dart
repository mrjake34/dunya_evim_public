import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/constants/size/paddings.dart';
import '../../core/utils/translation/locale_keys.g.dart';

class CustomDialog {
  Future<void> showCustomDialog(BuildContext context, Widget child) async {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: const RoundedRectangleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.pagePadding),
            child: child,
          ),
        );
      },
    );
  }

  Future<void> showCustomFullScreenDialog(BuildContext context, Widget child) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(),
          content: Container(
            padding: const EdgeInsets.all(AppPadding.pagePadding),
            child: child,
          ),
        );
      },
    );
  }

  Future<void> showCustomDialogError({required BuildContext context, required Widget child, Function()? buttonFunction}) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          shape: const RoundedRectangleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.pagePadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                child,
                TextButton(
                  onPressed: buttonFunction != null
                      ? buttonFunction
                      : () {
                          Navigator.pop(context);
                        },
                  child: Text(
                    LocaleKeys.mainText_confirm.tr(),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
