part of 'location_page.dart';

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
                context.read<LoginBloc>().add(GetUserCurrentLocationEvent());
              },
              text: LocaleKeys.mainText_chooseLocation,
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
