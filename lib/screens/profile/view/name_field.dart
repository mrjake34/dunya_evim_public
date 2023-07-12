part of 'profile_page.dart';

class NameField extends StatelessWidget {
  const NameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.userModel?.fullName ?? '',
              style: context.textTheme.titleLarge,
            ),
          ],
        );
      },
    );
  }
}