part of '../detail_builder.dart';

class AdvertTypeField extends StatelessWidget {
  const AdvertTypeField({
    super.key,
    required this.advertType,
  });

  final String? advertType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.pagePadding),
      child: Row(
        children: [
          Expanded(
              child: Text(
            LocaleKeys.advert_advertType.tr(),
          )),
          Expanded(
            child: Text(
              advertType ?? '',
              textAlign: TextAlign.end,
            ).tr(),
          ),
        ],
      ),
    );
  }
}
