part of '../../../detail_page.dart';

class AddNumberOfRooms extends StatelessWidget {
  const AddNumberOfRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.pageSize.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30,
            child: Text(
              LocaleKeys.advert_numberOfRooms.tr(),
              style: context.textTheme.titleMedium,
            ),
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: AdvertList.numberOfRooms.length,
              itemBuilder: (BuildContext context, int index) {
                return TextButton(
                  onPressed: () {
                    context.read<EditAdvertBloc>().add(AddNumberOfRoomsEvent(numberOfRooms: AdvertList.numberOfRooms[index]));
                  },
                  child: Text(
                    AdvertList.numberOfRooms[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
