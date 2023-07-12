part of 'register_page.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofillHints: [
        AutofillHints.email,
      ],
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.mail,
          size: 20,
        ),
        label: RequiredText(
          text: LocaleKeys.profile_emailAddress,
        ),
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(AppRadius.cardRadius))),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
        ),
        FormBuilderValidators.email(
          errorText: LocaleKeys.errors_justEnterEmail.tr(),
        )
      ]),
    );
  }
}
