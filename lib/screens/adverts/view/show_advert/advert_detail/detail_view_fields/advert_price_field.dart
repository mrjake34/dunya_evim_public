part of '../detail_builder.dart';

class AdvertPriceField extends StatelessWidget {
  const AdvertPriceField({
    super.key,
    required this.price,
  });

  final String? price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.pagePadding),
      child: Row(
        children: [
          Expanded(
              child: Text(
            LocaleKeys.advert_advertPrice.tr(),
          )),
          Expanded(
              child: Text(
            price ?? '',
            textAlign: TextAlign.end,
          ))
        ],
      ),
    );
  }
}
