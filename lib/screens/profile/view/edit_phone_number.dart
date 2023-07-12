part of 'profile_page.dart';

class EditPhoneNumber extends StatelessWidget {
  EditPhoneNumber({
    super.key,
  });

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.pagePadding),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CountryCodePicker(
                      onChanged: (value) {
                        context.read<ProfileBloc>().add(EditDialCodeEvent(code: value));
                      },
                      padding: EdgeInsets.zero,
                      initialSelection: context.locale.countryCode,
                      textStyle: TextStyle(color: context.colorScheme.primary),
                      dialogBackgroundColor: context.colorScheme.background,
                      dialogTextStyle: TextStyle(color: context.colorScheme.onBackground),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: TextFormField(
                      maxLength: 15,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: phoneController,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        hintText: '123 45 67 89',
                      ),
                      keyboardType: TextInputType.phone,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.numeric(errorText: LocaleKeys.errors_justEnterNumber.tr()),
                        FormBuilderValidators.required(errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
                      ]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              MainElevatedButton(
                onPressed: () {
                  if (phoneController.text.isNotEmpty && state.countryCode != null) {
                    context.read<ProfileBloc>().add(EditPhoneNumberEvent(phone: phoneController.text));
                  } else if (state.countryCode == null && phoneController.text.isNotEmpty) {
                    CustomDialog().showCustomDialogError(context: context, child: BodyTitleText(text: LocaleKeys.errors_chooseAnCountry));
                  } else {
                    CustomDialog().showCustomDialogError(context: context, child: BodyTitleText(text: LocaleKeys.errors_pleaseEnterAllField));
                  }
                },
                text: LocaleKeys.mainText_save,
              ),
            ],
          );
        },
      ),
    );
  }
}
