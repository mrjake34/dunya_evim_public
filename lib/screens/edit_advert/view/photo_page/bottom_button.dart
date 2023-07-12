part of 'photo_page.dart';

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditAdvertBloc, EditAdvertState>(
      buildWhen: (previous, current) => previous.advertDatasUploaded != current.advertDatasUploaded,
      builder: (context, state) {
        return Row(
          children: [
            Spacer(),
            Expanded(
              flex: 3,
              child: ElevatedButton(
                onPressed: state.advertDatasUploaded == Status.loading
                    ? null
                    : () async {
                        NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.editAdvertLocationPage);
                      },
                child: Icon(
                  Icons.arrow_circle_left_outlined,
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 3,
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, profState) {
                  return ElevatedButton(
                    onPressed: state.advertDatasUploaded == Status.loading
                        ? null
                        : () {
                            context.read<EditAdvertBloc>().add(SendAdvertData(uid: profState.userModel?.uid, userMail: profState.userModel?.email));
                          },
                    child: Icon(
                      Icons.save_outlined,
                    ),
                  );
                },
              ),
            ),
            Spacer(),
          ],
        );
      },
    );
  }
}
