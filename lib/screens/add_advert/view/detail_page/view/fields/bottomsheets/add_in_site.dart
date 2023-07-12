part of '../../../detail_page.dart';

class AddInSite extends StatelessWidget {
  const AddInSite({super.key});

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
              LocaleKeys.advert_inSite.tr(),
              style: context.textTheme.titleMedium,
            ),
          ),
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: AdvertList.inSiteEnumList.length,
                itemBuilder: (context, int index) {
                  return TextButton(
                    onPressed: () {
                      context.read<AddAdvertBloc>().add(AddInSiteEvent(inSiteEnums: AdvertList.inSiteEnumList[index]));
                    },
                    child: Text(
                      AdvertList.inSiteEnumList[index].value,
                    ).tr(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
