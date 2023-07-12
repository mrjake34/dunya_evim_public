part of 'profile_page.dart';

class EditBiography extends StatelessWidget {
  EditBiography({
    super.key,
  });

  final TextEditingController biographyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.pageSize.height,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(AppPadding.pagePadding),
        child: Column(
          children: [
            BodyTitleText(
              text: LocaleKeys.profile_biography,
            ),
            TextFormField(
              maxLength: 500,
              maxLines: 5,
              minLines: 5,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: biographyController,
              decoration: const InputDecoration(),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                    errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MainElevatedButton(
              onPressed: () {
                if (biographyController.text.isNotEmpty) {
                  context.read<ProfileBloc>().add(EditUserBioEvent(biography: biographyController.text));
                }
              },
              text: LocaleKeys.mainText_save,
            ),
          ],
        ),
      ),
    );
  }
}
