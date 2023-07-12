part of '../../detail_page.dart';

class AdvertCanVideoCallField extends StatefulWidget {
  const AdvertCanVideoCallField({
    super.key,
  });

  @override
  State<AdvertCanVideoCallField> createState() => _AdvertCanVideoCallFieldState();
}

class _AdvertCanVideoCallFieldState extends State<AdvertCanVideoCallField> {
  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditAdvertBloc, EditAdvertState>(
      builder: (context, state) {
        if (state.model?.canVideoCall != null) {
          _controller = TextEditingController(text: state.canVideoCallEnums?.value.tr() ?? state.model?.canVideoCall?.tr() ?? '');
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
            label: RequiredText(text: LocaleKeys.advert_canVideoCall),
            border: AppRadius.textFieldBorder,
          ),
          onTap: () => FixedSizeModalBottomSheet().openCustomModalSheet(context: context, widget: AddCanVideoCall()),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
          ]),
        );
      },
    );
  }
}
