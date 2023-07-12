part of 'show_advert_location.dart';

class _LocationServiceDeniedForever extends StatelessWidget {
  const _LocationServiceDeniedForever();

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
            BodyTitleText(text: LocaleKeys.errors_locationServiceDeniedForever),
            Spacer(
              flex: 8,
            ),
            MainElevatedButton(
              onPressed: () {
                NavigationService.instance.navigateToFirst();
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
