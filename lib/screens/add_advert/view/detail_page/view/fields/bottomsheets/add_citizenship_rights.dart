part of '../../../detail_page.dart';

class AddCitizenshipRights extends StatelessWidget {
  const AddCitizenshipRights({super.key});

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
              LocaleKeys.advert_citizenship.tr(),
              style: context.textTheme.titleMedium,
            ),
          ),
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: AdvertList.citizenshipRightsEnumList.length,
                itemBuilder: (context, int index) {
                  return TextButton(
                    onPressed: () {
                      context
                          .read<AddAdvertBloc>()
                          .add(AddCitizenshipRightsEvent(citizenshipRightsEnums: AdvertList.citizenshipRightsEnumList[index]));
                    },
                    child: Text(
                      AdvertList.citizenshipRightsEnumList[index].value,
                    ).tr(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
