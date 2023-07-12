import 'package:dunya_evim/screens/auth/register/bloc/register_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../core/constants/enums/bloc_enums.dart';
import '../../../../core/utils/navigation/navigation_service.dart';
import '../../../../core/utils/snackbar/show_snackbar.dart';
import '../../../../core/utils/translation/locale_keys.g.dart';
import '../../../../src/dialog/show_dialog.dart';
import 'register_page.dart';

mixin RegisterPageMixin on State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();
  final NavigationService navService = NavigationService.instance;
  final ShowSnackbar showSnackbar = ShowSnackbar.instance;
  final formKey = GlobalKey<FormBuilderState>();
  void showFirebaseAuthErrorDialogs(RegisterState state) {
    if (state.firebaseAuthErrorEnums == FirebaseAuthErrorEnums.emailAlreadyInUse) {
      CustomDialog().showCustomDialogError(
        context: context,
        child: Text(
          LocaleKeys.errors_emailAlreadyExists.tr(),
          textAlign: TextAlign.center,
        ),
        buttonFunction: () {
          context.read<RegisterBloc>().add(RegisterClearErrorEvent());
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
          context.read<RegisterBloc>().add(RegisterClearErrorEvent());
          NavigationService.instance.navigateToBack();
        },
      );
    } else if (state.firebaseAuthErrorEnums == FirebaseAuthErrorEnums.error) {
      ShowSnackbar.instance.errorSnackBar(LocaleKeys.errors_anErrorHasOccurred.tr());
      context.read<RegisterBloc>().add(RegisterClearErrorEvent());
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    countryController.dispose();
    emailController.dispose();
    passwordController.dispose();
    password2Controller.dispose();
  }
}
