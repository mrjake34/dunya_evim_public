part of '../../detail_page.dart';

class AdvertFurnitureStatusField extends StatefulWidget {
  const AdvertFurnitureStatusField({
    super.key,
  });

  @override
  State<AdvertFurnitureStatusField> createState() => _AdvertFurnitureStatusFieldState();
}

class _AdvertFurnitureStatusFieldState extends State<AdvertFurnitureStatusField> {
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
        if (state.furnitureEnums?.value != null) {
          _controller = TextEditingController(text: state.furnitureEnums?.value.tr());
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
            label: RequiredText(text: LocaleKeys.advert_furnitureStatus),
            border: AppRadius.textFieldBorder,
          ),
          onTap: () => FixedSizeModalBottomSheet().openCustomModalSheet(context: context, widget: AddFurniture()),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
          ]),
        );
      },
    );
  }
}
