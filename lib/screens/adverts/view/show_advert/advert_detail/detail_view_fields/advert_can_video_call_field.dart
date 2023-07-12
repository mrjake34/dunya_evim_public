part of '../detail_builder.dart';

class AdvertCanVideoCallField extends StatelessWidget {
  const AdvertCanVideoCallField({
    super.key,
    this.canVideoCall,
  });

  final String? canVideoCall;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.pagePadding),
      child: Row(
        children: [
          Expanded(
              child: Text(
            LocaleKeys.advert_canVideoCall.tr(),
          )),
          Expanded(
              child: Text(
            canVideoCall ?? '',
            textAlign: TextAlign.end,
          ).tr())
        ],
      ),
    );
  }
}
