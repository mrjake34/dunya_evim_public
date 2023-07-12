part of 'profile_page.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return ListTile(
          title: Text(LocaleKeys.profile_phoneNumber.tr()),
          subtitle: BodyText(
            text: state.userModel?.phone ?? LocaleKeys.mainText_noPhoneNumer,
          ),
          leading: Icon(Icons.phone_outlined),
          trailing: TextButton(
            child: state.userModel?.phone == null
                ? ButtonText(
                    text: LocaleKeys.mainText_add.tr(),
                  )
                : ButtonText(
                    text: LocaleKeys.mainText_edit.tr(),
                  ),
            onPressed: () async {
              await FullScreenModalBottomSheet().openCustomModalSheet(context: context, widget: EditPhoneNumber());
            },
          ),
        );
      },
    );
  }
}
