part of '../detail_builder.dart';

class AdvertHasFurnitureField extends StatelessWidget {
  const AdvertHasFurnitureField({
    super.key,
    this.furnitureStatus,
  });

  final String? furnitureStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.pagePadding),
      child: Row(
        children: [
          Expanded(
              child: Text(
            LocaleKeys.advert_furnitureStatus.tr(),
          )),
          Expanded(
            child: Text(
              furnitureStatus ?? '',
              textAlign: TextAlign.end,
            ).tr(),
          ),
        ],
      ),
    );
  }
}
