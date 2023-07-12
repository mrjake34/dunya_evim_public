part of '../detail_builder.dart';

class AdvertInSiteField extends StatelessWidget {
  const AdvertInSiteField({
    super.key,
    this.inSite,
  });

  final String? inSite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.pagePadding),
      child: Row(
        children: [
          Expanded(
              child: Text(
            LocaleKeys.advert_inSite.tr(),
          )),
          Expanded(
              child: Text(
            inSite ?? '',
            textAlign: TextAlign.end,
          ).tr())
        ],
      ),
    );
  }
}
