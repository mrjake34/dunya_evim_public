part of '../detail_page.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.formKey,
  });
  final GlobalKey<FormBuilderState> formKey;


  @override
  Widget build(BuildContext context) {
    return AddAdvertBottomNavBar(
      leftOnPressed: () {
        NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.home);
      },
      rightOnPressed: () {
        if (formKey.currentState?.validate() ?? false) {
          NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.editAdvertNotePage);
        } else {
          ShowSnackbar.instance.errorSnackBar(LocaleKeys.errors_pleaseEnterAllField);
        }
      },
    );
  }
}
