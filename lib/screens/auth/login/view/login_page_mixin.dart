import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../core/constants/enums/bloc_enums.dart';
import '../../../../core/utils/navigation/navigation_service.dart';
import '../../../../core/utils/translation/locale_keys.g.dart';
import '../../../../core/utils/snackbar/show_snackbar.dart';
import '../../../../src/dialog/show_dialog.dart';
import '../bloc/login_bloc.dart';
import '../model/login_request_model.dart';
import 'login_page.dart';

mixin LoginPageMixin on State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginKey = GlobalKey<FormBuilderState>();

  String get getEmailController => emailController.text.trim();
  String get getPasswordController => passwordController.text.trim();
  LoginRequestModel get getLoginRequestModel => LoginRequestModel(email: getEmailController, password: getPasswordController);
  void showFirebaseAuthErrorDialogs(LoginState state) {
    if (state.firebaseAuthErrorEnums == FirebaseAuthErrorEnums.userNotFound) {
      CustomDialog().showCustomDialogError(
        context: context,
        child: Text(
          LocaleKeys.errors_userNotFound.tr(),
          textAlign: TextAlign.center,
        ),
        buttonFunction: () {
          context.read<LoginBloc>().add(UserLoginClearLoginErrorEvent());
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
          context.read<LoginBloc>().add(UserLoginClearLoginErrorEvent());
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
          context.read<LoginBloc>().add(UserLoginClearLoginErrorEvent());
          NavigationService.instance.navigateToBack();
        },
      );
    } else if (state.firebaseAuthErrorEnums == FirebaseAuthErrorEnums.error) {
      ShowSnackbar.instance.errorSnackBar(LocaleKeys.errors_anErrorHasOccurred.tr());
      context.read<LoginBloc>().add(UserLoginClearLoginErrorEvent());
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
