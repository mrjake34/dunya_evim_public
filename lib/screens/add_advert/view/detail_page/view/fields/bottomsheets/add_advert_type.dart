part of '../../../detail_page.dart';

class AddAdvertType extends StatelessWidget {
  const AddAdvertType({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.pageSize.width,
      child: Column(
        children: [
          SizedBox(
            height: 30,
            child: Text(
              LocaleKeys.advert_advertType.tr(),
              style: context.textTheme.titleMedium,
            ),
          ),
          Flexible(
            child: ListView.builder(
                itemCount: AdvertList.advertTypeEnumList.length,
                itemBuilder: (context, int index) {
                  return TextButton(
                    onPressed: () {
                      if (AdvertList.advertTypeEnumList[index].value.isNotEmpty) {
                        context.read<AddAdvertBloc>().add(AddAdvertTypeEvent(advertTypeEnums: AdvertList.advertTypeEnumList[index]));
                      }
                    },
                    child: Text(
                      AdvertList.advertTypeEnumList[index].value,
                    ).tr(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
