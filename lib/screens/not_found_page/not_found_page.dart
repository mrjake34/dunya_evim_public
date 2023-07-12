import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/constants/routers/routers.dart';
import '../../core/utils/navigation/navigation_service.dart';
import '../../core/utils/translation/locale_keys.g.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.errors_pageNotFound.tr()),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.home);
            },
            child: Text(LocaleKeys.mainText_homepage.tr())),
      ),
    );
  }
}
