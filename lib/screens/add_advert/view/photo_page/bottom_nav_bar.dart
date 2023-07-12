part of 'photo_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdvertBloc, AddAdvertState>(
      builder: (context, state) {
        return AddAdvertBottomNavBar(
          leftOnPressed: () async {
            NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.addAdvertLocationPage);
          },
          rightOnPressed: () async {
            if (state.files != null) {
              NavigationService.instance.navigateToPage(path: RoutersConstants.addAdvertReviewPage);
            } else {
              ShowSnackbar.instance.showSnackBar(LocaleKeys.errors_uploadAnPhoto);
            }
          },
        );
      },
    );
  }
}
