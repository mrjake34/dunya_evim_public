part of '../../../detail_page.dart';

class AddCanVideoCall extends StatelessWidget {
  const AddCanVideoCall({super.key});

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
              LocaleKeys.advert_canVideoCall.tr(),
              style: context.textTheme.titleMedium,
            ),
          ),
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: AdvertList.canVideoCallEnumList.length,
                itemBuilder: (context, int index) {
                  return TextButton(
                    onPressed: () {
                      context.read<AddAdvertBloc>().add(AddCanVideoCallEvent(canVideoCallEnums: AdvertList.canVideoCallEnumList[index]));
                    },
                    child: Text(
                      AdvertList.canVideoCallEnumList[index].value,
                    ).tr(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
