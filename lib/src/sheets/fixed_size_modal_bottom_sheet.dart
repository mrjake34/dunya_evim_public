import 'package:flutter/material.dart';

class FixedSizeModalBottomSheet {
  openCustomModalSheet({required BuildContext context, required Widget widget}) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      useRootNavigator: true,
      useSafeArea: true,
      builder: (context) {
        return widget;
      },
    );
  }
}
