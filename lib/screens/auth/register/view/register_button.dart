part of 'register_page.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton(
      {super.key,
      required this.formKey,
      required this.nameController,
      required this.emailController,
      required this.countryController,
      required this.passwordController});

  final GlobalKey<FormBuilderState> formKey;
  final TextEditingController nameController;
  final TextEditingController countryController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.status == Status.success) {
          ShowSnackbar.instance.showSnackBar(LocaleKeys.succes_registerSuccess.tr());
          NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.loginPage);
        }
      },
      builder: (context, state) {
        if (state.status == Status.loading) {
          return LoadingButton();
        } else {
          return MainElevatedButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                if (state.isUserAgreementAccepted ?? false) {
                  context.read<RegisterBloc>().add(PostUserRegisterEvent(
                      model: RegisterRequestModel(
                          email: emailController.text.trim(),
                          fullName: nameController.text.trim(),
                          country: countryController.text.trim(),
                          password: passwordController.text.trim())));
                } else {
                  CustomDialog().showCustomDialogError(context: context, child: Text(LocaleKeys.errors_errorUserAgreement.tr()));
                }
              } else {
                ShowSnackbar.instance.errorSnackBar(LocaleKeys.errors_pleaseEnterAllField.tr());
              }
            },
            text: LocaleKeys.mainText_signup.tr(),
          );
        }
      },
    );
  }
}
