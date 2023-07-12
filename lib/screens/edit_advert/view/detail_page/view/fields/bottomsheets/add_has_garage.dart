part of '../../../detail_page.dart';

class AddHasGarage extends StatelessWidget {
  const AddHasGarage({super.key});

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
              LocaleKeys.advert_hasGarage.tr(),
              style: context.textTheme.titleMedium,
            ),
          ),
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: AdvertList.hasGarageEnumList.length,
                itemBuilder: (context, int index) {
                  return TextButton(
                    onPressed: () {
                      context.read<EditAdvertBloc>().add(AddHasGarageEvent(hasGarageEnums: AdvertList.hasGarageEnumList[index]));
                    },
                    child: Text(
                      AdvertList.hasGarageEnumList[index].value,
                    ).tr(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
