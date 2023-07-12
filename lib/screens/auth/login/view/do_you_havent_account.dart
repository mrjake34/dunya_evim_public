part of 'login_page.dart';

class _DoYouHaventAccount extends StatelessWidget {
  const _DoYouHaventAccount();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: LocaleKeys.mainText_haventAccount.tr(),
        children: [
          TextSpan(text: ' '),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.registerPage);
              },
              child: Text(
                LocaleKeys.mainText_createAccount.tr(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.buttonColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
