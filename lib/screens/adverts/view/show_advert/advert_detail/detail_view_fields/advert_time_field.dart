part of '../detail_builder.dart';

class AdvertTimeField extends StatelessWidget {
  const AdvertTimeField({
    super.key,
    required this.advertTime,
  });

  final String? advertTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.pagePadding),
      child: Row(
        children: [
          Expanded(
              child: Text(
            LocaleKeys.advert_advertTime.tr(),
          )),
          Expanded(
              child: Text(
            advertTime ?? '',
            textAlign: TextAlign.end,
            style: TextStyle(),
          ))
        ],
      ),
    );
  }
}
