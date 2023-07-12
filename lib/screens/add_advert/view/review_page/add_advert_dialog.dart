part of 'review_page.dart';

class AddAdvertDialog extends StatelessWidget {
  const AddAdvertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(AppPadding.pagePadding),
          child: Wrap(
            runSpacing: 5,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              Text(
                LocaleKeys.alerts_advert_addAdvertTextListFirst.tr(),
                style: context.textTheme.bodyMedium,
              ),
              Text(
                LocaleKeys.alerts_advert_addAdvertTextListSecond.tr(),
                style: context.textTheme.bodyMedium,
              ),
              Text(
                LocaleKeys.alerts_advert_addAdvertTextListThird.tr(),
                style: context.textTheme.bodyMedium,
              ),
              Text(
                LocaleKeys.alerts_advert_addAdvertTextListFourth.tr(),
                style: context.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.home);
                },
                child: Text(LocaleKeys.mainText_remove.tr()),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  NavigationService.instance.navigateToBack();
                },
                child: Text(LocaleKeys.mainText_edit.tr()),
              ),
            ),
            Expanded(
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, profState) {
                  return Container(
                    // listenWhen: (previous, current) => current.photoUrlUploaded != Status.success,
                    // listener: (context, state) {
                    //   if (state.photoUrlUploaded == Status.success) {
                    //     context.read<AddAdvertBloc>().add(SendAdvertData(uid: profState.userModel?.uid, userMail: profState.userModel?.email));
                    //   } else if (state.photoUrlUploaded == Status.failed) {
                    //     ShowSnackbar.instance.showSnackBar(LocaleKeys.errors_errorUploadingPhotos);
                    //   }
                    // },
                    child: TextButton(
                      onPressed: () async {
                        NavigationService.instance.navigateToBack();
                        if (profState.userModel?.uid != null) {
                          context.read<AddAdvertBloc>().add(SendAdvertData(uid: profState.userModel?.uid, userMail: profState.userModel?.email));
                        } else {
                          ShowSnackbar.instance.errorSnackBar(LocaleKeys.errors_userNotFound);
                        }
                      },
                      child: Text(LocaleKeys.advert_addAdvert.tr()),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
