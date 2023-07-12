part of '../pass_reset.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      textInputAction: TextInputAction.done,
      autofillHints: [AutofillHints.email],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        prefixIcon: Icon(
          Icons.mail_outline,
          size: 20,
        ),
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(AppRadius.cardRadius))),
        labelText: LocaleKeys.mainText_enterMailAddress.tr(),
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
        FormBuilderValidators.email(errorText: LocaleKeys.mainText_enterMailAddress.tr()),
      ]),
    );
  }
}
