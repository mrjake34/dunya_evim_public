part of 'profile_page.dart';

class EditLocation extends StatelessWidget {
  EditLocation({
    super.key,
  });

  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      onChanged: (value) {
        context.read<ProfileBloc>().add(EditUserLocationEvent(country: value));
      },
      padding: EdgeInsets.zero,
      initialSelection: context.locale.countryCode,
      textStyle: TextStyle(color: context.colorScheme.primary),
      dialogBackgroundColor: context.colorScheme.background,
      dialogTextStyle: TextStyle(color: context.colorScheme.onBackground),
      showCountryOnly: true,
      hideMainText: true,
    );
  }
}
