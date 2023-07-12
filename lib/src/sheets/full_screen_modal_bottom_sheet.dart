import 'package:flutter/material.dart';

class FullScreenModalBottomSheet {
  openCustomModalSheet({required BuildContext context, required Widget widget}) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      useRootNavigator: true,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) {
        return widget;
      },
    );
  }
}
