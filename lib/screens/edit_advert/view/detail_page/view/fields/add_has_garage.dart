part of '../../detail_page.dart';

class AdvertHasGarageField extends StatefulWidget {
  const AdvertHasGarageField({
    super.key,
  });

  @override
  State<AdvertHasGarageField> createState() => _AdvertHasGarageFieldState();
}

class _AdvertHasGarageFieldState extends State<AdvertHasGarageField> {
  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditAdvertBloc, EditAdvertState>(
      builder: (context, state) {
        if (state.model?.hasGarage != null) {
          _controller = TextEditingController(text: state.hasGarageEnums?.value.tr() ?? state.model?.hasGarage?.tr() ?? '');
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
            label: RequiredText(text: LocaleKeys.advert_hasGarage),
            border: AppRadius.textFieldBorder,
          ),
          onTap: () => FixedSizeModalBottomSheet().openCustomModalSheet(context: context, widget: AddHasGarage()),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
          ]),
        );
      },
    );
  }
}
