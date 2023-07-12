part of '../detail_builder.dart';

class AdvertNumberOfRoomsField extends StatelessWidget {
  const AdvertNumberOfRoomsField({
    super.key,
    this.numberOfRooms,
  });

  final String? numberOfRooms;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.pagePadding),
      child: Row(
        children: [
          Expanded(
              child: Text(
            LocaleKeys.advert_numberOfRooms.tr(),
          )),
          Expanded(
              child: Text(
            numberOfRooms ?? '',
            textAlign: TextAlign.end,
          ))
        ],
      ),
    );
  }
}
