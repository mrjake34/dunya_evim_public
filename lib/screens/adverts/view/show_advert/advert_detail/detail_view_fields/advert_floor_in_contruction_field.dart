part of '../detail_builder.dart';

class AdvertFloorInConstructionField extends StatelessWidget {
  const AdvertFloorInConstructionField({
    super.key,
    this.floorInConstruction,
    this.totalFloorInConstruction,
  });

  final String? floorInConstruction;
  final String? totalFloorInConstruction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.pagePadding),
      child: Row(
        children: [
          Expanded(
              child: Text(
            LocaleKeys.advert_floorInConstruction.tr(),
          )),
          Expanded(
              child: Text(
            "${floorInConstruction} / ${totalFloorInConstruction ?? ''}",
            textAlign: TextAlign.end,
          ))
        ],
      ),
    );
  }
}
