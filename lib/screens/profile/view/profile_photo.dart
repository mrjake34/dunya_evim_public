part of 'profile_page.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary,
            blurRadius: 10,
          ),
        ],
      ),
      child: Stack(
        children: [
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state.ppPhotoStatus == Status.loading) {
                return Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state.userModel?.ppUrl != null) {
                return CircleAvatar(
                  backgroundColor: context.colorScheme.background,
                  radius: 80,
                  backgroundImage: NetworkImage(
                    '${state.userModel?.ppUrl}.jpg',
                  ),
                );
              } else {
                return CircleAvatar(
                  backgroundColor: context.colorScheme.background,
                  radius: 80,
                  backgroundImage: AssetImage(
                    ImagePath.dunyaEvimLogoPath,
                  ),
                );
              }
            },
          ),
          Positioned(
            bottom: 4,
            right: -10,
            child: RawMaterialButton(
              elevation: 3.0,
              fillColor: context.colorScheme.background,
              padding: const EdgeInsets.all(7.0),
              shape: const CircleBorder(),
              child: Icon(
                Icons.add_a_photo_outlined,
                color: context.colorScheme.primary,
              ),
              onPressed: () {
                FixedSizeModalBottomSheet().openCustomModalSheet(context: context, widget: ChoosePhotoBottomSheet());
              },
            ),
          ),
        ],
      ),
    );
  }
}
