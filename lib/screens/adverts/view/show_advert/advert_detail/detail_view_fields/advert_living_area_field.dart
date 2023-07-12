part of '../detail_builder.dart';

class AdvertLivingAreaField extends StatelessWidget {
  const AdvertLivingAreaField({
    super.key,
    this.livingArea,
  });

  final String? livingArea;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.pagePadding),
      child: Row(
        children: [
          Expanded(
              child: Text(
            LocaleKeys.advert_livingArea.tr(),
          )),
          Expanded(
              child: Text(
            "${livingArea ?? ''}m²",
            textAlign: TextAlign.end,
          ))
        ],
      ),
    );
  }
}
