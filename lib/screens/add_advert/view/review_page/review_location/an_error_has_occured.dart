part of 'review_location.dart';

class _AnErrorHasOccured extends StatelessWidget {
  const _AnErrorHasOccured();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppPadding.pagePadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Spacer(
              flex: 9,
            ),
            BodyTitleText(text: LocaleKeys.errors_anErrorHasOccurred),
            Spacer(
              flex: 8,
            ),
            MainElevatedButton(
              onPressed: () {
                NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.home);
              },
              text: LocaleKeys.mainText_homepage,
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
