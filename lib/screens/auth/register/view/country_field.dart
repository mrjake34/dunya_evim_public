part of 'register_page.dart';

class CountryField extends StatelessWidget {
  const CountryField({
    super.key,
    required this.countryController,
  });

  final TextEditingController countryController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listenWhen: (previous, current) => previous.country != current.country,
      listener: (context, state) {
        if (state.country != null) {
          countryController.text = state.country?.name ?? '';
        }
      },
      builder: (context, state) {
        return TextFormField(
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autofillHints: [
            AutofillHints.addressCity,
          ],
          controller: countryController,
          readOnly: true,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.location_on,
              size: 20,
            ),
            label: RequiredText(
              text: LocaleKeys.profile_livingArena,
            ),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  AppRadius.cardRadius,
                ),
              ),
            ),
            suffixIcon: CountryCodePicker(
              onChanged: (value) {
                context.read<RegisterBloc>().add(ChangeLocationEvent(country: value));
              },
              padding: EdgeInsets.zero,
              initialSelection: context.locale.countryCode,
              textStyle: TextStyle(color: context.colorScheme.primary),
              dialogBackgroundColor: context.colorScheme.background,
              dialogTextStyle: TextStyle(color: context.colorScheme.onBackground),
              showCountryOnly: true,
              hideMainText: true,
            ),
          ),
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(
                errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}
