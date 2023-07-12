part of 'profile_page.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, loginState) {
      return ListTile(
        title: Text(LocaleKeys.profile_emailAddress.tr()),
        subtitle: Text(loginState.userCredential?.user?.email ?? ''),
        leading: const Icon(
          Icons.mail_outline,
        ),
        trailing: TextButton(
          onPressed: loginState.userCredential?.user?.emailVerified == false
              ? () {
                  NavigationService.instance.navigateToPage(path: RoutersConstants.reSendVerifyEmailPage);
                }
              : null,
          child: loginState.userCredential?.user?.emailVerified == false
              ? Text(
                  LocaleKeys.profile_verify.tr(),
                  style: TextStyle(color: AppColors.errorColor),
                )
              : Icon(
                  Icons.verified_outlined,
                  color: AppColors.succesColor,
                ),
        ),
      );
    });
  }
}
