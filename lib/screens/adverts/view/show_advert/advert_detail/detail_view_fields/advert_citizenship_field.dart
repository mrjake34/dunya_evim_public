part of '../detail_builder.dart';

class AdvertCitizenshipField extends StatelessWidget {
  const AdvertCitizenshipField({
    super.key,
    this.citizenship,
  });

  final String? citizenship;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.pagePadding),
      child: Row(
        children: [
          Expanded(
            child: Text(
              LocaleKeys.advert_citizenship.tr(),
            ),
          ),
          Expanded(
            child: Text(
              citizenship ?? '',
              textAlign: TextAlign.end,
            ).tr(),
          ),
        ],
      ),
    );
  }
}
