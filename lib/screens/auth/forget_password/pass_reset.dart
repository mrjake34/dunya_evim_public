import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:dunya_evim/core/constants/size/paddings.dart';
import 'package:dunya_evim/core/utils/translation/locale_keys.g.dart';
import 'package:dunya_evim/screens/auth/forget_password/view/pass_reset_mixin.dart';

import '../../../core/constants/enums/bloc_enums.dart';
import '../../../core/constants/size/radius.dart';
import '../../../core/utils/snackbar/show_snackbar.dart';
import '../../../src/buttons/loading_button.dart';
import '../../../src/buttons/main_elevated_button.dart';
import 'bloc/pass_reset_bloc.dart';

part './view/pass_reset_button.dart';
part './view/pass_reset_textfield.dart';

class PassReset extends StatefulWidget {
  const PassReset({super.key});

  @override
  State<PassReset> createState() => _PassResetState();
}

class _PassResetState extends State<PassReset> with PassResetMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.mainText_resetPassword.tr()),
      ),
      body: BlocListener<PassResetBloc, PassResetState>(
        // listenWhen: (previous, current) => previous.firebaseAuthErrorEnums != current.firebaseAuthErrorEnums,
        listener: (context, state) {
          if (state.firebaseAuthErrorEnums == FirebaseAuthErrorEnums.userNotFound ||
              state.firebaseAuthErrorEnums == FirebaseAuthErrorEnums.wrongPassword ||
              state.firebaseAuthErrorEnums == FirebaseAuthErrorEnums.manyTried) {
            showFirebaseAuthErrorDialogs(state);
          }
        },
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppPadding.pagePadding),
              child: FormBuilder(
                autoFocusOnValidationFailure: true,
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      LocaleKeys.mainText_resetPasswordEmailInfo.tr(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    EmailTextField(emailController: emailController),
                    SizedBox(
                      height: 20,
                    ),
                    PassResetButton(formKey: formKey, emailController: emailController),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
