part of '../../detail_page.dart';

class AdvertCitizienshipRightsField extends StatefulWidget {
  const AdvertCitizienshipRightsField({
    super.key,
  });

  @override
  State<AdvertCitizienshipRightsField> createState() => _AdvertCitizienshipRightsFieldState();
}

class _AdvertCitizienshipRightsFieldState extends State<AdvertCitizienshipRightsField> {
  late TextEditingController _controller;
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdvertBloc, AddAdvertState>(
      builder: (context, state) {
        if (state.citizenshipRightsEnums?.value != null) {
          _controller = TextEditingController(text: state.citizenshipRightsEnums?.value.tr());
        } else {
          _controller = TextEditingController();
        }
        return TextFormField(
          readOnly: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: _controller,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            filled: true,
            helperText: ' ',
            suffixIcon: Icon(Icons.expand_circle_down_outlined),
            label: RequiredText(text: LocaleKeys.advert_citizenship),
            border: AppRadius.textFieldBorder,
          ),
          onTap: () => FixedSizeModalBottomSheet().openCustomModalSheet(context: context, widget: AddCitizenshipRights()),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
          ]),
        );
      },
    );
  }
}
