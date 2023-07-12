part of 'note_page.dart';

class BottomButton extends StatelessWidget {
  BottomButton({super.key, required this.noteKey});
  final GlobalKey<FormBuilderState> noteKey;

  @override
  Widget build(BuildContext context) {
    return AddAdvertBottomNavBar(
      leftOnPressed: () {
        NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.addAdvertDetailPage);
      },
      rightOnPressed: () {
        if (noteKey.currentState!.validate()) {
          NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.addAdvertLocationPage);
        }
      },
    );
  }
}
