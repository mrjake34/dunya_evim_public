part of '../detail_builder.dart';

class AdvertHeatingSystemField extends StatelessWidget {
  const AdvertHeatingSystemField({
    super.key,
    this.heatingSystem,
  });

  final String? heatingSystem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.pagePadding),
      child: Row(
        children: [
          Expanded(
            child: Text(
              LocaleKeys.advert_heatingSystem.tr(),
            ),
          ),
          Expanded(
            child: Text(
              heatingSystem ?? '',
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
