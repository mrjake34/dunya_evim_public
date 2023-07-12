part of 'register_page.dart';

class RePasswordField extends StatelessWidget {
  const RePasswordField({
    super.key,
    required this.password2Controller,
    required this.passwordController,
  });

  final TextEditingController password2Controller;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          controller: password2Controller,
          textInputAction: TextInputAction.done,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: state.rePassVisibility ?? true,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock, size: 20),
            label: RequiredText(
              text: LocaleKeys.mainText_rePassword,
            ),
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(AppRadius.cardRadius))),
            suffixIcon: IconButton(
              icon: Icon(
                state.rePassVisibility == false ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                context.read<RegisterBloc>().add(
                      RePassVisibilityEvent(),
                    );
              },
            ),
          ),
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
              FormBuilderValidators.minLength(6, errorText: LocaleKeys.errors_errorPasswordLength.tr()),
              FormBuilderValidators.match(passwordController.value.text, errorText: LocaleKeys.errors_passwordDontMatch.tr())
            ],
          ),
        );
      },
    );
  }
}
