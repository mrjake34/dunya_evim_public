part of 'login_page.dart';

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          controller: passwordController,
          autofillHints: [AutofillHints.password],
          textInputAction: TextInputAction.done,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: state.passwordVisibility ?? true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            prefixIcon: const Icon(Icons.lock_outline, size: 20),
            labelText: LocaleKeys.mainText_password.tr(),
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(AppRadius.cardRadius))),
            suffixIcon: IconButton(
              icon: Icon(
                state.passwordVisibility == false ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              ),
              onPressed: () {
                context.read<LoginBloc>().add(UserLoginPasswordVisibilityEvent());
              },
            ),
          ),
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(errorText: LocaleKeys.errors_errorEnterPassword.tr()),
            ],
          ),
        );
      },
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField({
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      autofillHints: [AutofillHints.email],
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        prefixIcon: Icon(
          Icons.mail_outline,
          size: 20,
        ),
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(AppRadius.cardRadius))),
        labelText: LocaleKeys.profile_emailAddress.tr(),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
        FormBuilderValidators.email(errorText: LocaleKeys.errors_justEnterEmail.tr())
      ]),
    );
  }
}
