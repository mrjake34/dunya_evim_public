// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_page.dart';

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required this.loginKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormBuilderState> loginKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (previous, current) => previous.userCredential != current.userCredential,
      listener: (context, state) {
        if (state.userCredential != null) {
          NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.home);
        }
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status == Status.loading) {
          return LoadingButton();
        } else {
          return MainElevatedButton(
            onPressed: () {
              if (loginKey.currentState!.validate()) {
                context
                    .read<LoginBloc>()
                    .add(UserLoginEvent(model: LoginRequestModel(email: emailController.text.trim(), password: passwordController.text.trim())));
              } else {
                ShowSnackbar.instance.errorSnackBar(LocaleKeys.errors_pleaseEnterAllField.tr());
              }
            },
            text: LocaleKeys.mainText_login.tr(),
          );
        }
      },
    );
  }
}

class _PassResetButton extends StatelessWidget {
  const _PassResetButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        LocaleKeys.mainText_forgetPassword.tr(),
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const PassReset(),
      )),
    );
  }
}
