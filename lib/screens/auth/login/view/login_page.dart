import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../../core/constants/color/colors.dart';
import '../../../../core/constants/enums/bloc_enums.dart';
import '../../../../core/constants/path/image_path.dart';
import '../../../../core/constants/routers/routers.dart';
import '../../../../core/constants/size/paddings.dart';
import '../../../../core/constants/size/radius.dart';
import '../../../../core/utils/navigation/navigation_service.dart';
import '../../../../core/utils/snackbar/show_snackbar.dart';
import '../../../../core/utils/translation/locale_keys.g.dart';
import '../../../../src/buttons/loading_button.dart';
import '../../../../src/buttons/main_elevated_button.dart';
import '../../forget_password/pass_reset.dart';
import '../bloc/login_bloc.dart';
import '../model/login_request_model.dart';
import 'login_page_mixin.dart';
part 'do_you_havent_account.dart';
part 'login_page_button.dart';
part 'login_page_textfields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.mainText_login.tr(),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.home);
            },
            icon: Icon(Icons.home_outlined)),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppPadding.pagePadding),
            child: FormBuilder(
              key: loginKey,
              child: BlocListener<LoginBloc, LoginState>(
                listenWhen: (previous, current) => previous.firebaseAuthErrorEnums != current.firebaseAuthErrorEnums,
                listener: (context, state) {
                  showFirebaseAuthErrorDialogs(state);
                },
                child: Column(
                  children: [
                    _LogoField(),
                    SizedBox(
                      height: 20,
                    ),
                    _EmailTextField(emailController: emailController),
                    SizedBox(
                      height: 20,
                    ),
                    _PasswordTextField(passwordController: passwordController),
                    SizedBox(
                      height: 20,
                    ),
                    _LoginButton(
                      loginKey: loginKey,
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _PassResetButton(),
                    SizedBox(
                      height: 20,
                    ),
                    _DoYouHaventAccount(),
                    SizedBox(
                      height: 20,
                    ),
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

class _LogoField extends StatelessWidget {
  const _LogoField();

  @override
  Widget build(BuildContext context) {
    final Size pageSize = MediaQuery.of(context).size;
    return Center(
      child: Image.asset(
        ImagePath.dunyaEvimLogoPath,
        fit: BoxFit.fitWidth,
        height: pageSize.height * 0.2,
        width: pageSize.width * 0.8,
      ),
    );
  }
}
