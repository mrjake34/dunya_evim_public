part of 'register_page.dart';

class MembershipAgreement extends StatelessWidget {
  const MembershipAgreement({super.key, required this.showSnackbar});
  final ShowSnackbar showSnackbar;
  Future<bool> openMembershipAgreement() async {
    if (!await launchUrl(AppLinks.instance.membershipAgreement)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return Checkbox(
                checkColor: Theme.of(context).colorScheme.background,
                value: state.isUserAgreementAccepted ?? false,
                onChanged: (bool? newValue) {
                  context.read<RegisterBloc>().add(UserAgreementEvent(isUserAgreement: newValue));
                });
          },
        ),
        TextButton(
          onPressed: () {
            final isOpened = openMembershipAgreement();
            if (isOpened == false) {
              showSnackbar.errorSnackBar(LocaleKeys.errors_errorGoogleDocs.tr());
            }
          },
          child: RequiredText(
            text: LocaleKeys.mainText_userAgreement,
          ),
        )
      ],
    );
  }
}
