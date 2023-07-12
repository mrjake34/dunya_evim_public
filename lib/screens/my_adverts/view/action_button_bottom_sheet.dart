part of 'my_adverts_card.dart';

class ActionButtonBottomSheet extends StatelessWidget {
  const ActionButtonBottomSheet({required this.model, super.key});
  final AdvertModel model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppPadding.pagePadding),
      child: Wrap(
        runSpacing: 10,
        children: [
          SizedBox(
            width: context.pageSize.width,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(side: BorderSide(color: AppColors.buttonColor)),
              onPressed: () {
                if (model.docId?.isNotEmpty ?? false) {
                  try {
                    context.read<EditAdvertBloc>().add(FetchAdvertDetailEvent(docId: model.docId));
                  } finally {
                    NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.editAdvertDetailPage);
                  }
                }
              },
              child: Text(
                LocaleKeys.mainText_edit.tr(),
                style: TextStyle(color: AppColors.buttonColor),
              ),
            ),
          ),
          Builder(builder: (context) {
            if (model.stoppedByOwner == true) {
              return SizedBox(
                width: context.pageSize.width,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(side: BorderSide(color: AppColors.succesColor)),
                  onPressed: () {},
                  child: Text(
                    LocaleKeys.mainText_startListing.tr(),
                    style: TextStyle(color: AppColors.succesColor),
                  ),
                ),
              );
            } else {
              return SizedBox(
                width: context.pageSize.width,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(side: BorderSide(color: AppColors.errorColor)),
                  onPressed: () {},
                  child: Text(
                    LocaleKeys.mainText_stopListing.tr(),
                    style: TextStyle(color: AppColors.errorColor),
                  ),
                ),
              );
            }
          }),
          SizedBox(
            width: context.pageSize.width,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(side: BorderSide(color: AppColors.errorColor)),
              onPressed: () {},
              child: Text(
                LocaleKeys.mainText_remove.tr(),
                style: TextStyle(color: AppColors.errorColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
