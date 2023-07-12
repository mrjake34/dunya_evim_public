part of '../detail_builder.dart';

class AdvertAreaField extends StatelessWidget {
  const AdvertAreaField({super.key, this.country, this.state});

  final String? country;
  final String? state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.pagePadding),
      child: Row(
        children: [
          Expanded(
              child: Text(
            LocaleKeys.advert_advertArea.tr(),
          )),
          Expanded(
              child: Text(
            '${state ?? ''} / ${country ?? ''}',
            textAlign: TextAlign.end,
          ))
        ],
      ),
    );
  }
}
