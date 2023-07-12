import 'package:country_code_picker/country_code_picker.dart';
import 'package:dunya_evim/core/base/extension/app_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../core/constants/enums/bloc_enums.dart';
import '../../../../core/constants/routers/routers.dart';
import '../../../../core/constants/size/paddings.dart';
import '../../../../core/utils/navigation/navigation_service.dart';
import '../../../../core/utils/snackbar/show_snackbar.dart';
import '../../../../core/utils/translation/locale_keys.g.dart';
import '../../../../src/buttons/loading_button.dart';
import '../../../../src/buttons/main_elevated_button.dart';
import 'register_page_mixin.dart';
import '../../../../src/text/required_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/color/colors.dart';
import '../../../../core/constants/path/link_path.dart';
import '../../../../core/constants/size/radius.dart';
import '../../../../src/dialog/show_dialog.dart';
import '../bloc/register_bloc.dart';
import '../model/register_request_model.dart';
part 'register_button.dart';
part 'do_you_have_an_account.dart';
part 'membership_agreement.dart';
part 'repassword_field.dart';
part 'password_field.dart';
part 'email_field.dart';
part 'country_field.dart';
part 'name_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with RegisterPageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listenWhen: (previous, current) => previous.firebaseAuthErrorEnums != current.firebaseAuthErrorEnums,
      listener: (context, state) {
        showFirebaseAuthErrorDialogs(state);
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.pagePadding),
            child: FormBuilder(
              key: formKey,
              autoFocusOnValidationFailure: true,
              child: Wrap(
                runSpacing: AppPadding.textFieldSpace,
                alignment: WrapAlignment.center,
                children: <Widget>[
                  NameField(nameController: nameController),
                  CountryField(countryController: countryController),
                  EmailField(emailController: emailController),
                  PasswordField(passwordController: passwordController, password2Controller: password2Controller),
                  RePasswordField(password2Controller: password2Controller, passwordController: passwordController),
                  MembershipAgreement(
                    showSnackbar: showSnackbar,
                  ),
                  RegisterButton(
                    formKey: formKey,
                    countryController: countryController,
                    emailController: emailController,
                    nameController: nameController,
                    passwordController: passwordController,
                  ),
                  DoYouHaveAnAccount(navService: navService),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
