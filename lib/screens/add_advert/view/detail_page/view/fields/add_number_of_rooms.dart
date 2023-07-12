part of '../../detail_page.dart';

class AdvertNumberOfRoomsField extends StatefulWidget {
  const AdvertNumberOfRoomsField({
    super.key,
  });

  @override
  State<AdvertNumberOfRoomsField> createState() => _AdvertNumberOfRoomsFieldState();
}

class _AdvertNumberOfRoomsFieldState extends State<AdvertNumberOfRoomsField> {
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
        if (state.numberOfRooms != null) {
          _controller = TextEditingController(text: state.numberOfRooms ?? ' ');
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
            label: RequiredText(text: LocaleKeys.advert_numberOfRooms),
            border: AppRadius.textFieldBorder,
          ),
          onTap: () => FixedSizeModalBottomSheet().openCustomModalSheet(
            context: context,
            widget: AddNumberOfRooms(),
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: LocaleKeys.errors_dontLeaveEmpty.tr(),
            ),
          ]),
        );
      },
    );
  }
}
