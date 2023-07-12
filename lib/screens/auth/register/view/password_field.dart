part of 'register_page.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.passwordController,
    required this.password2Controller,
  });

  final TextEditingController passwordController;
  final TextEditingController password2Controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          controller: passwordController,
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: state.passVisibility ?? true,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock, size: 20),
            label: RequiredText(text: LocaleKeys.mainText_password),
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(AppRadius.cardRadius))),
            suffixIcon: IconButton(
              icon: Icon(
                state.passVisibility == false ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                context.read<RegisterBloc>().add(
                      PassVisibilityEvent(),
                    );
              },
            ),
          ),
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(
                errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
              ),
              FormBuilderValidators.minLength(
                6,
                errorText: LocaleKeys.errors_errorPasswordLength.tr(),
              ),
              FormBuilderValidators.match(
                password2Controller.value.text,
                errorText: LocaleKeys.errors_passwordDontMatch.tr(),
              )
            ],
          ),
        );
      },
    );
  }
}
