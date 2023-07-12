part of 'detail_page.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.detailKey,
  });
  final GlobalKey<FormBuilderState> detailKey;

  @override
  Widget build(BuildContext context) {
    return AddAdvertBottomNavBar(
      leftOnPressed: () {
        NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.home);
      },
      rightOnPressed: () {
        if (detailKey.currentState!.validate()) {
          NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.addAdvertNotePage);
        }
      },
    );
  }
}
