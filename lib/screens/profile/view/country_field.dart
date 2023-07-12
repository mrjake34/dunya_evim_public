part of 'profile_page.dart';

class CountryField extends StatelessWidget {
  const CountryField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return ListTile(
          title: Text(LocaleKeys.profile_livingArena.tr()),
          subtitle: Text(state.userModel?.country ?? ''),
          leading: const Icon(
            Icons.location_on_outlined,
          ),
          trailing: EditLocation(),
        );
      },
    );
  }
}