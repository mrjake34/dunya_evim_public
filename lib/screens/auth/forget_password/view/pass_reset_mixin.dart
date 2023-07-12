import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/enums/bloc_enums.dart';
import '../../../../core/utils/navigation/navigation_service.dart';
import '../../../../core/utils/translation/locale_keys.g.dart';
import '../../../../core/utils/snackbar/show_snackbar.dart';
import '../../../../src/dialog/show_dialog.dart';
import '../bloc/pass_reset_bloc.dart';
import '../pass_reset.dart';

mixin PassResetMixin on State<PassReset> {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void showFirebaseAuthErrorDialogs(PassResetState state) {
    if (state.firebaseAuthErrorEnums == FirebaseAuthErrorEnums.userNotFound) {
      CustomDialog().showCustomDialogError(
        context: context,
        child: Text(
          LocaleKeys.errors_userNotFound.tr(),
          textAlign: TextAlign.center,
        ),
        buttonFunction: () {
          context.read<PassResetBloc>().add(ClearPassResetErrorEvent());
          NavigationService.instance.navigateToBack();
        },
      );
    } else if (state.firebaseAuthErrorEnums == FirebaseAuthErrorEnums.wrongPassword) {
      CustomDialog().showCustomDialogError(
        context: context,
        child: Text(
          LocaleKeys.errors_passwordWrong.tr(),
          textAlign: TextAlign.center,
        ),
        buttonFunction: () {
          context.read<PassResetBloc>().add(ClearPassResetErrorEvent());
          NavigationService.instance.navigateToBack();
        },
      );
    } else if (state.firebaseAuthErrorEnums == FirebaseAuthErrorEnums.manyTried) {
      CustomDialog().showCustomDialogError(
        context: context,
        child: Text(
          LocaleKeys.errors_tooManyRequests.tr(),
          textAlign: TextAlign.center,
        ),
        buttonFunction: () {
          context.read<PassResetBloc>().add(ClearPassResetErrorEvent());
          NavigationService.instance.navigateToBack();
        },
      );
    } else if (state == FirebaseAuthErrorEnums.error) {
      ShowSnackbar.instance.errorSnackBar(LocaleKeys.errors_anErrorHasOccurred.tr());
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
