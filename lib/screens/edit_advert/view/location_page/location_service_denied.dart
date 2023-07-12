part of 'location_page.dart';

class _LocationServiceDenied extends StatelessWidget {
  const _LocationServiceDenied();

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
            BodyTitleText(text: LocaleKeys.errors_locationServiceOff),
            Spacer(
              flex: 8,
            ),
            MainElevatedButton(
              onPressed: () {
                context.read<LoginBloc>().add(GetUserCurrentLocationEvent());
              },
              text: LocaleKeys.mainText_chooseLocation,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
