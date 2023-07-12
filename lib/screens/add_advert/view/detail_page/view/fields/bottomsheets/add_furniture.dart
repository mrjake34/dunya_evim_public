part of '../../../detail_page.dart';

class AddFurniture extends StatelessWidget {
  const AddFurniture({super.key});

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
              LocaleKeys.advert_furnitureStatus.tr(),
              style: context.textTheme.titleMedium,
            ),
          ),
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: AdvertList.furnitureEnumList.length,
                itemBuilder: (context, int index) {
                  return TextButton(
                    onPressed: () {
                      context.read<AddAdvertBloc>().add(AddFurnitureEvent(furnitureEnums: AdvertList.furnitureEnumList[index]));
                    },
                    child: Text(
                      AdvertList.furnitureEnumList[index].value,
                    ).tr(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
