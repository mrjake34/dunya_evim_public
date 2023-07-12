part of 'note_page.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.noteKey});

  final GlobalKey<FormBuilderState> noteKey;

  @override
  Widget build(BuildContext context) {
    return AddAdvertBottomNavBar(
      leftOnPressed: () {
        NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.editAdvertDetailPage);
      },
      rightOnPressed: () {
        if (noteKey.currentState!.validate()) {
          NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.editAdvertLocationPage);
        } else {
          ShowSnackbar.instance.errorSnackBar(LocaleKeys.errors_dontLeaveEmpty.tr());
        }
      },
    );
  }
}
