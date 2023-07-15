part of 'my_adverts_card.dart';

final class _ActionButtonBottomSheet extends StatefulWidget {
  const _ActionButtonBottomSheet({required this.model});
  final AdvertModel model;

  @override
  State<_ActionButtonBottomSheet> createState() => _ActionButtonBottomSheetState();
}

class _ActionButtonBottomSheetState extends State<_ActionButtonBottomSheet> with _ActionButtonBottomSheetMixin {


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
              onPressed: _editAdvertDetail,
              child: Text(
                LocaleKeys.mainText_edit.tr(),
                style: TextStyle(color: AppColors.buttonColor),
              ),
            ),
          ),
          Builder(
            builder: (context) {
              if (widget.model.stoppedByOwner == true) {
                return SizedBox(
                  width: context.pageSize.width,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(side: BorderSide(color: AppColors.succesColor)),
                    onPressed: _startListingFunc,
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
                    onPressed: _stopListingFunc,
                    child: Text(
                      LocaleKeys.mainText_stopListing.tr(),
                      style: TextStyle(color: AppColors.errorColor),
                    ),
                  ),
                );
              }
            },
          ),
          SizedBox(
            width: context.pageSize.width,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(side: BorderSide(color: AppColors.errorColor)),
              onPressed: _removeAdvertFunc,
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
