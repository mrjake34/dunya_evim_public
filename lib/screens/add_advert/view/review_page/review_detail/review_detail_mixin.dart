import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/utils/snackbar/show_snackbar.dart';
import '../../../../../../core/utils/translation/locale_keys.g.dart';

import 'review_detail.dart';

mixin ReviewDetailMixin on State<AddAdvertReviewDetailPage> {
  Future<void> whatsApp({String? userPhone}) async {
    try {
      if (!await launchUrl(Uri.parse('whatsapp://send?phone=$userPhone'))) {
        throw 'whatsapp error';
      }
    } catch (e) {
      ShowSnackbar.instance.errorSnackBar(LocaleKeys.errors_noWhatsapp);
    }
  }

  Future<void> callPhone({String? userPhone}) async {
    if (await launchUrl(Uri.parse('tel:+$userPhone'))) {
    } else {
      ShowSnackbar.instance.errorSnackBar(LocaleKeys.errors_anErrorHasOccurred);
    }
  }

  Future<void> sendMail({String? userMail}) async {
    launchUrl(
      Uri.parse('mailto:$userMail'),
    );
  }
}
