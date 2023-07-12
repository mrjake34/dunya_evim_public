part of 'profile_page.dart';

class BiographyField extends StatelessWidget {
  const BiographyField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, right: 15, left: 15, bottom: 15),
      child: Column(
        children: [
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    children: [
                      BodyTitleText(
                        text: LocaleKeys.profile_biography,
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () => FullScreenModalBottomSheet().openCustomModalSheet(
                          context: context,
                          widget: EditBiography(),
                        ),
                        child: ButtonText(
                          text: LocaleKeys.mainText_edit,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    state.userModel?.userBio ?? '',
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}