part of '../detail_builder.dart';

class AdvertAddressField extends StatelessWidget {
  const AdvertAddressField({
    super.key,
    this.address,
  });

  final String? address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.pagePadding),
      child: Row(
        children: [
          Expanded(
              child: Text(
            LocaleKeys.advert_advertAddress.tr(),
          )),
          Expanded(
              child: Text(
            address ?? '',
            textAlign: TextAlign.end,
          ))
        ],
      ),
    );
  }
}