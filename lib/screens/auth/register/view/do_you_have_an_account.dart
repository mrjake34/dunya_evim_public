part of 'register_page.dart';

class DoYouHaveAnAccount extends StatelessWidget {
  const DoYouHaveAnAccount({
    super.key,
    required this.navService,
  });

  final NavigationService navService;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(),
        text: LocaleKeys.mainText_haveAccount.tr(),
        children: [
          TextSpan(text: " "),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                navService.navigateToPage(
                  path: RoutersConstants.loginPage,
                );
              },
              child: Text(
                LocaleKeys.mainText_login.tr(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.buttonColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
