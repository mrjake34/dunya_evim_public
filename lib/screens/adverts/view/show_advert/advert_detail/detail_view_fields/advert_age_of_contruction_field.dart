part of '../detail_builder.dart';

class AdvertAgeOfConstructionField extends StatelessWidget {
  const AdvertAgeOfConstructionField({
    super.key,
    required this.ageOfConstruction,
  });

  final String? ageOfConstruction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.pagePadding),
      child: Row(
        children: [
          Expanded(
              child: Text(
            LocaleKeys.advert_ageOfConstruction.tr(),
          )),
          Expanded(
              child: Text(
            ageOfConstruction ?? '',
            textAlign: TextAlign.end,
          ))
        ],
      ),
    );
  }
}