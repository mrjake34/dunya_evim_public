part of '../detail_builder.dart';

class AdvertHasGarageField extends StatelessWidget {
  const AdvertHasGarageField({
    super.key,
    this.hasGarage,
  });

  final String? hasGarage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.pagePadding),
      child: Row(
        children: [
          Expanded(
            child: Text(
              LocaleKeys.advert_hasGarage.tr(),
            ),
          ),
          Expanded(
            child: Text(
              hasGarage ?? '',
              textAlign: TextAlign.end,
            ).tr(),
          ),
        ],
      ),
    );
  }
}
